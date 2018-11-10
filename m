From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 10 Nov 2018 18:57:24 +0100
Subject: [Buildroot] [PATCH 1/3] fs: apply permissions late
In-Reply-To: <762db85d-d4a9-95b5-8280-d46dfd5f2a72@mind.be>
References: <cover.1540626349.git.yann.morin.1998@free.fr>
 <4f9a31b0fb8f87ded9c788cb92d727b6763859ac.1540626349.git.yann.morin.1998@free.fr>
 <762db85d-d4a9-95b5-8280-d46dfd5f2a72@mind.be>
Message-ID: <20181110175724.GG2445@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-11-08 00:43 +0100, Arnout Vandecappelle spake thusly:
> On 27/10/18 09:45, Yann E. MORIN wrote:
> > The combination of fakeroot, tar, and capabilities is broken, because
> > fakeroot currently badly handles capabilities, which are currently
> > simply ignored.
> 
>  "simply ignored" can't be the case, otherwise it still wouldn't work after this
> patch.

No, because fakeroot really badly handles capabilties, as demonstrated
in another mail in that thread. And yes, capabilties *are* currently
simply ignored, and that's on purpose (not that changing would fix it
anyway, and I'm not even totally sure this is related, and neither am I
really sure to understand what it even really means), added in
c994c3db1f7d (fakeroot: disable capabilities):

    https://git.buildroot.org/buildroot/tree/package/fakeroot/fakeroot.mk#n12

    # Force capabilities detection off
    # For now these are process capabilities (faked) rather than file
    # so they're of no real use
    HOST_FAKEROOT_CONF_ENV = \
        ac_cv_header_sys_capability_h=no \
        ac_cv_func_capset=no

[--SNIP--]
> > As described in #11216, asking tar to explicitly store and restore
> > capabilities ends up with a failling build, when tar actually tries to
> > restore the capabilities. Adding support for capabilities to fakeroot
> > (by adding host-libcap as dependency) does not fix the problem.
> 
>  Just to be clear: with this patch, the 'tar' filesystem does still work because
> the creation of the tarball works OK, it's just the extraction that goes wrong,
> right?

Oh, you poinpoint an issue: the tar filesystem must be also modified to
add --xattrs-include='*' otherwise it would not contain any xattrs, and
even less so, any capabilty.

So, with this patch, the 'tar' filesystem is not fixed, but this is not
a regression either, as it did not have capabilties, and it still does
not.

Now, should we fix the tar filesystem, a tarball of the rootfs is
supposed to be extracted by root, the real root, not a fake root, and
as Peter demonstrated, there is no problem with capabilities in a
tarball that is extracted by root.

> > Capabilities are stored in the extended attribute security.capabilty.
> > It turns out that tar does have special handling when extracting and
> > restoring that extended attribute, and that fails miserably when running
> > under fakeroot...
> > 
> > We fix that by offloading the permissions handling down to individual
> > filesystems.
> > 
> > This needs a split of the makedevs call, with the current and first one
> > now only responsible for creating the pseudo devices, while the new,
> > second call does only set the permissions.
> 
>  Why? Is that just to reduce the impact on post-fakeroot scripts?

The idea of the common, intermediate tarball was to include all the
common actions, to avoid repeating them for each filesystem.

Since the creating of device nodes in /dev is not impacted by the
capabilties, I left that in the common part, and only moved the
offending part (setting permissions, which includes capabilties) to the
per-filesystem actions.

It had about nothing to do with the post-fakeroot scripts that I had
thought about.

>  I'd rather move the entire makedevs call to the per-filesystem phase.

I'm still not convinced, as this is not needed (capabilties don't make
sense on device nodes), except if we were to entirely drop the
intemediate tarball altogether.

> > Fixes: #11216
> > 
> > This changes the order of steps, and post-fakeroot scripts are now
> > called before the permissions are set. This could mean breaking existing
> > setups, but more probably, this woudl sovle some, where files created in
> > post-fakeroot scripts can now see their permissions appropriately set.
> 
>  Since extracting xattrs doesn't work correctly, this is not true.i

Sorry, re-reading this, I see where you choked on my explanations. The
underlying reasoning I had, was that files created in a post-fakeroot
scripts could have appropriate capabilties by providing a permissions
table, which is _now_ applied after those files are created.

So, before this patch, capabilities created in a post-fakeroot scripts
were not working, and there was no way to set capabilties on those
files. With this patch, they are not working either, but there is a
workaround by providing a permissions table.

> And normally
> in a post-fakeroot script, you would do any permission setting in the script
> itself and not use the permissions table.

Except that was not working so far, and nobody complained, so nobody was
doing that anyway.

> So I think this statement is utterly
> wrong.

s/utterly//  makes it easier to read, thanks. And yes, it was wrong,
except it did not properly convey my thinking. I hope the above
explanations make it a bit less wrong.

> That said, I doubt that post-build scripts would be affected by the
> permissions tables anyway.

> > This also slightly breaks the idea behind the intermediate image, which
> > was supposed to gather all actions common to all filesystems, so that
> > they are not repeated. Still, most actions are still created only once,
> > and moving just this is purely a practical and pragmatic workaround.
> 
>  Still, I'd prefer to fix fakeroot :-)

Then, please be my guest! ;-) I already fixed something in fakeroot, and
I dread working on that code base any more...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
