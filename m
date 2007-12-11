From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 11 Dec 2007 17:28:33 +1100
Subject: [Buildroot] [buildroot 0001568]: "make BOARD=xyz menuconfig"
	/	oldconfig etc does not work
In-Reply-To: <b55faafb87f5cc5a7566708c821671b2@busybox.net>
References: <b55faafb87f5cc5a7566708c821671b2@busybox.net>
Message-ID: <20071211062833.GA8833@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 27, 2007 at 01:28:49PM -0800, bugs at busybox.net wrote:
> Description: 
> buildroot allows you to do "make BOARD=xyz world" to compile using the
> configuration file in local/xyz/xyz.config, but you can't call menuconfig,
> oldconfig etc in this way.
> 
> The problem is that the name of the configuration file isn't being passed
> to the kconfig tool (package/config/conf). kconfig uses $BUILDROOT_CONFIG,
> so all that is needed is to set that environment variable.
> 
> Patch attached fixes this so that "make BOARD=xyz oldconfig" works.
> ====================================================================== 
> 
> ---------------------------------------------------------------------- 
>  hmoffatt - 11-01-07 18:02  
> ---------------------------------------------------------------------- 
> "make BOARD=xyz world" also fails due to a few more hard-coded references
> to .config. br2-board-config2.diff fixes those. 
> 
> ---------------------------------------------------------------------- 
>  UlfSamuelsson - 11-27-07 13:28  
> ---------------------------------------------------------------------- 
> Once you have a ".config" file, you can store your board configuration by:
> 
> $ make saveconfig
> 
> This will store the .config for buildroot, linux, uclibc and busybox.
> If the project name is "xyz", then they will be stored in the "local/xyz"
> 
> 
> You can retrieve your configuration by:
> 
> $ make BOARD=xyz getconfig
> 
> It is wrong to make the things depend on BUILDROOT_CONFIG.
> They should depend on ".config" 

That's ok if you want to use getconfig and saveconfig all the time. I
would rather not have any .config but always use "make BOARD=xyz ...".

IMHO there is too much risk of forgetting to save your configuration. 
You could "make menuconfig" then "make getconfig" and forget to
saveconfig in between. I already hate it that you have to 
"make busybox-update" and "make linux-update" and "make uclibc-update" 
after reconfiguring those - they should just use my configuration files 
as specified by BR2_PACKAGE_BUSYBOX_CONFIG etc. 

This can be done by either modifying the kconf tools to use an
environment variable, or perhaps by symlinking the relevant files to
.config instead of copying them (assuming kconf's save is
symlink-friendly).

I mean no offense when I ask, is project support well-supported by the
buildroot community over all? Is it your work originally Ulf with little
support from the others? Some things like the above don't work as I
expect them, so it feels a bit rough. In the case of my patch in this
bug report, you could apply it and make me happy without any detriment
to the way you work (with getconfig/saveconfig).

Regards
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
