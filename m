From: Matthew Starr <mstarr@hedonline.com>
Date: Tue, 16 Jun 2015 12:31:19 -0500
Subject: [Buildroot] [PATCH 1/1] system: make sh symlink match original
	busybox symlink path
In-Reply-To: <20150616163146.GA5730@free.fr>
References: <64CA5C49A43E314D9F7DAE05370E2F7B05F54E6F@hed-dc01.hed.local>
 <20150616163146.GA5730@free.fr>
Message-ID: <64CA5C49A43E314D9F7DAE05370E2F7B067710BE@hed-dc01.hed.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

> -----Original Message-----
> From: Yann E. MORIN [mailto:yann.morin.1998 at gmail.com]
> Matthew, All,
> 
> On 2015-06-16 10:41 -0500, Matthew Starr spake thusly:
> > The symlink created by buildroot for /bin/sh when busybox is used is
> > the full path to /bin/busybox and does not match the symlink created
> > by busybox for /bin/sh, which is just busybox.  When handling files on
> > the host system this will point to the host system's busybox if
> > present and not the target busybox.
> 
> I fail to see the problem that would cause. We have quite a few other
> absolute symlinks. Do we want to fix all of them?

This is an absolute symlink that will affect everyone who may want to perform a checksum of the system or possibly perform other actions on files for the target while on the host system.  I have yet to encounter other symlinks that have this issue, not to say there aren't any, but this one is an important one.

> 
> Note: yes, I thinf I know what your problenm is, that is checksuming-or-such
> the content of each file. I believe this is wrong, because that would miss the
> information that this is actually a *symlink*, and would not detect the fact
> that is is replacec with an actual file (and hence takes more place on the
> device than is expected).

Yes, doing a checksum on the host and comparing to the installed target is the functionality I am using to ensure a correct install.

> 
> I would find it much smarter that:
>   - files get their content checksumed
>   - symlinks get their target path checksumed, not the content of the
>     target file (or dir). I.e. symlinks should not be dereferenced.

I agree this would be a smarter approach, but I have yet to see a simple utility to do this.    Instead it is quite simple to just use md5sum in a script or md5deep.  In the absence of such a utility, the easiest fix is to change the symlink that buildroot creates.

Additionally this was not an issue in previous versions of buildroot before BR2_SYSTEM_BIN_SH was created in 2014.11.   In the previous version the /bin/sh symlink was just busybox.

> 
> > This is fixed by changing the /bin/sh symlink to just be busybox since
> > both files are in the same directory.
> >
> > Signed-off-by: Matthew Starr <mstarr@hedonline.com>
> > ---
> >  system/Config.in | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/system/Config.in b/system/Config.in index
> > 84cde94..5c4ba90 100644
> > --- a/system/Config.in
> > +++ b/system/Config.in
> > @@ -236,7 +236,7 @@ endchoice # /bin/sh
> >
> >  config BR2_SYSTEM_BIN_SH
> >  	string
> > -	default "/bin/busybox" if BR2_SYSTEM_BIN_SH_BUSYBOX
> > +	default "busybox" if BR2_SYSTEM_BIN_SH_BUSYBOX
> 
> Please, keep the alignment of the if-clause.
> 
> >  	default "/bin/bash"    if BR2_SYSTEM_BIN_SH_BASH
> >  	default "/bin/dash"    if BR2_SYSTEM_BIN_SH_DASH
> >  	default "/bin/zsh"     if BR2_SYSTEM_BIN_SH_ZSH
> 
> If you contend that /bin/sh being an absolute symlink is an issue, then surely
> the other shells should be treated the same, i.e. they should be madde
> relative symlinks.

I have looked at several different Linux distributions and they all seem to use relative paths for the /bin/sh symlink.   Based on this then the /bin/sh symlink to bash, dash, and zsh should also be updated to be relative.

> 
> All that matters in the end is that the symlink is correct *on the target".  I'm
> not sure this change is interesting without a good reason; and I don't think
> you 10.192.168.1gave a good-enough reason; saying "the symlink is different
> than what busybox installs" is not a valid reason IMHO.

Dealing with symlinks when you are not on the installed system or in a chroot environment  is made more difficult by the use of absolute symlinks.  If managing symlinks on the host is required, then just having it correct on the target is not enough.

> 
> Regards,
> Yann E. MORIN.
> 
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> | conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

Best regards,
Matthew Starr
