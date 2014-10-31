From: Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
Date: Fri, 31 Oct 2014 16:35:09 -0300
Subject: [Buildroot] target rootfs permissions
In-Reply-To: <54529698.9010903@mind.be>
References: <20141024193436.GA29505@fox>
 <20141025103454.0b923b26@free-electrons.com>
 <20141030131530.GA12318@fox> <54529698.9010903@mind.be>
Message-ID: <20141031193509.GA31702@fox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Arnout,

On Thu, Oct 30, 2014 at 08:50:48PM +0100, Arnout Vandecappelle wrote:
> On 30/10/14 14:15, Guido Mart?nez wrote:
> [snip]
> > I have been trying a solution based on running 'chmod -R u=rwX,go=rX'
> > for the last few days and it seems to work just fine. We're basically
> > making everything public (exception should go in the device table or in
> > *_PERMISSIONS) and keeping the executable bits of files that already
> > have them. This saves the trouble of making packages declare which files
> > should be executable.
> > 
> > Packages should only declare ownerships, special permissions (like
> > sticky bits and setuids) and private files (like /etc/sudoers). Most of
> > them (at least the ones I could find) do exactly this, so I don't think
> > much breakage should appear (but undoubtedly, some will). I'd go as far
> > as saying that 644 is the default permissions everyone unconsciously has
> > in mind.
> 
>  There is one problem with this solution: it means that for each package, we
> have to make sure that we find and apply all the special permissions it
> requires. And that's something that can only be discovered at runtime. It's much
> better if we could rely on the package's build infrastructure to do the right thing.
You're right. This is an excellent point, thank you!

>  So what we really want to do is to clear the umask. I found [1] which suggests
> to do
> 
> SHELL = /bin/bash --noprofile -c 'umask 000; eval "$$2"' --
I agree with trying to fix the umask, but that snippet doesn't work for
me, not even in simple makefiles. One alternative I found is creating
a script under support/ that wraps all shell calls setting the umask
first, and setting SHELL to it.

BTW: Using a umask of 000 doesn't work really well. Some packages (at
least nginx and bzip2) install files using plain mkdir/cp, so the
binaries end up world-writable. I suggest 022.

>  Alternatively, we could also reset the umask in the places where it's relevant,
> i.e. where rsync and cp are used - but that's a bit complicated an risky - we
> might forget something.
> 
>  For the skeleton and overlay, the umask is not the issue, it's just the fact
> that we preserve permissions. That could easily be solved by using
> --chmod=u=rwX,go=rX for rsync.
Sounds reasonable.

I have a patch for both of these (wrapping shell calls and rsyncing with
--chmod). I'll send an RFC later.

Thanks a lot!

-- 
Guido Mart?nez, VanguardiaSur
www.vanguardiasur.com.ar
