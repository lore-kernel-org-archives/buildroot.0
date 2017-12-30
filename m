From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 Dec 2017 14:56:43 +0100
Subject: [Buildroot] [RFCv3 13/15] core: change host RPATH handling
In-Reply-To: <20171229212034.416e8b23@windsurf.lan>
References: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
 <20171201205352.24287-14-thomas.petazzoni@free-electrons.com>
 <20171229173118.GP3176@scaer>
 <20171229212034.416e8b23@windsurf.lan>
Message-ID: <20171230135643.GE2921@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-12-29 21:20 +0100, Thomas Petazzoni spake thusly:
> Hello,
> 
> On Fri, 29 Dec 2017 18:31:18 +0100, Yann E. MORIN wrote:
> 
> > > In order to achieve this, the following changes are made:
> > > 
> > >  - HOST_LDFLAGS no longer contains -Wl,-rpath,$(HOST_DIR)
> > > 
> > >  - The hook that ran at the end of every package installation
> > >    (check_host_rpath) to verify that our hardcoded RPATH is indeed
> > >    present in all binaries is removed, as it is no longer needed: we
> > >    will force $ORIGIN/../LIB as an RPATH in all binaries.  
> > 
> > Then you can just get rid of support/scripts/check-host-rpath that is
> > now no longer used.
> 
> True.
> 
> > 
> > >  - host-patchelf is added as a dependency of all packages, except
> > >    itself. This is necessary as all packages now need to run patchelf
> > >    at the end of their installation process.
> > > 
> > >    TODO: things like host-tar, host-lzip and host-ccache will have to
> > >    be handled properly.  
> 
> In fact, this TODO was no longer accurate: I did take care of host-tar,
> host-lzip and host-ccache as part of this RFCv3. However...

You said on IRC that the uniq-file check did not trigger for host-tar,
and I think I know why: we're looking at installed files in the step
hook named 'step_pkg_size' which gets run as part of the 'install-host'
step.

But the patchelf will only happen in the new step named 'install', which
you introduced in patch 05/15 (pkg-generic: add .stamp_installed step),
and which is called after 'install-host' (guaranteed, because 'install'
depends on 'install-host').

So, the uniq-file check will not get triggered for host-patchelf.

It will not even be trigger by a later package either, because the
hashes are taken before and after the install step, not from a previous
install step.

So, we are lucky.

However, I don't think this is nice...

> > Indeed, because the very moment that patchelf is available, the next
> > package will trigger patchelf on all executables, which means that
> > package will be responsible for touching files from previous packages,
> > and thus will trigger the no-two-packages-should-touch-the-same-file
> > check.
> 
> ... I indeed didn't think of this problem. I see two possibilities to
> address this:
> 
>  1. Have host-patchelf built earlier. I.e have only host-tar be a
>     dependency of host-patchelf and nothing else (in my current patch
>     series, host-patchelf is built after host-tar, host-xz, host-lzip,
>     host-ccache). This requires using HOSTCC_NOCCACHE to build host-tar
>     and host-patchelf, but I don't think it's a big deal. And then do a
>     special case in fix-rpath to not fix the rpath of the tar program,
>     since it should not have dependencies on libraries in HOST_DIR/lib
> 
>  2. Make the RPATH fixing logic smarter, and don't set a RPATH to
>     $ORIGIN/../lib if the program doesn't use a library that is in
>     HOST_DIR/lib. This is perhaps the most pretty solution.

 3. limit patchelf on the files actually installed by the current
    package, looking at $(BUILD_DIR)/packages-file-list-host.txt to
    get the list...

Actually, this might prompt for storing a per-package list of installed
file, something like (untested):

    diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
    index b4aa22e38c..4a086600dd 100644
    --- a/package/pkg-generic.mk
    +++ b/package/pkg-generic.mk
    @@ -89,8 +89,11 @@ define step_pkg_size_end
     	$(call _step_pkg_size_get_file_list,$($(PKG)_DIR)/.br_filelist_after,$(2))
     	comm -13 $($(PKG)_DIR)/.br_filelist_before $($(PKG)_DIR)/.br_filelist_after | \
     		while read hash file ; do \
    -			echo "$(1),$${file}" ; \
    -		done >> $(BUILD_DIR)/packages-file-list$(3).txt
    +			echo "$${file}" ; \
    +		done >> $($(PKG)_DIR)/.br_filelist.txt
    +		sed -r -e 's/^/$(1),/' \
    +			< $($(PKG)_DIR)/.br_filelist.txt \
    +			>> $(BUILD_DIR)/packages-file-list$(3).txt
     	rm -f $($(PKG)_DIR)/.br_filelist_before $($(PKG)_DIR)/.br_filelist_after
     endef

... and then re-using $($(PKG)_DIR)/.br_filelist.txt as the list of
files installed by the current package, and only patchelf thos liste in
there.

My 2ct...

Regards,
Yann E. MORIN.

> > > This change is independent from the per-package SDK functionality, and
> > > could be applied separately.  
> > 
> > Except it requires the host-tar et al. stuff to be handled first.
> 
> Which is why the host-tar and al. stuff is earlier. What I meant with
> this sentence is that reworking the host RPATH handling can be applied
> *before* we switch to per-package SDK.
> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
