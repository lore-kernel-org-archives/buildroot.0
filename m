From: Vadym Kochan <vadim4j@gmail.com>
Date: Mon, 11 Mar 2019 12:46:09 +0200
Subject: [Buildroot] [PATCH v3 0/2] Add gettext-tiny package
In-Reply-To: <20190311090235.4e64625b@windsurf>
References: <20190212215520.7422-1-vadim4j@gmail.com>
 <20190309233742.3095c546@windsurf>
 <20190310002005.jglt6ptlgctyz6eb@vkochan-ThinkPad-T470p>
 <20190310101126.3d738624@windsurf> <20190310101852.GB25009@scaer>
 <20190310230532.4dhczaa4sygw75ie@vkochan-ThinkPad-T470p>
 <20190311090235.4e64625b@windsurf>
Message-ID: <20190311104609.GA8459@lwo1-lhp-f71841>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Yann, All

On Mon, Mar 11, 2019 at 09:02:35AM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 11 Mar 2019 01:05:32 +0200
> Vadim Kochan <vadim4j@gmail.com> wrote:
> 
> > But, it looks like that there should be no problem if NLS is disabled
> > (host-gettext is provided by gettext-tiny) and gettext (target)
> > (provided by gettext-gnu) are enabled in the same time (of course 1
> > small fix is required in latest gettext-tiny series v3):
> > 
> > in file package/gettext/Config.in
> > 
> > > config BR2_PACKAGE_GETTEXT
> > >          bool "gettext"
> > >          select BR2_PACKAGE_HAS_GETTEXT  
> > *remove -> depends on BR2_SYSTEM_ENABLE_NLS
> > 		    
> > remove dependens on NLS to select gettext-gnu for the target.
> > 
> > So, both host-gettext-tiny and gettext-gnu should coexist as they
> > provides different instances, right ?
> > 
> > If this is ok, then of course ecryptfs-utils needs support the gettext-less
> > version, but it might be done later out of this scope ?
> 
> I don't really like to do this. It's a lot better if we can avoid
> gettext-gnu entirely if NLS is disabled. So I'd prefer if we could
> stick to one of the two options I proposed in my reply to your v3:
> 
> Option 1: we fix ecryptfs-utils to not unconditionally use gettext.
> 
> Option 2: we improve gettext-tiny so that it provides a fake gettext
> implementation, and we allow gettext-tiny as a gettext implementation
> for the target.
> 

Regarding ecryptfs-utils, looks like it is easy just to use
function with "gettext" name and if gettext exists (by "which") then use
the full path which is returned by "which", otherwise I think it is OK to
use just "echo" or Yann's wrapper. Here is a sample script:

----------8<----------------
#! /bin/sh

GETTEXT_PROG=""
gettext() {
    if [ -z "${GETTEXT_PROG}" ]; then
        GETTEXT_PROG=$(which gettext)
        if [ $? != 0 ]; then
            GETTEXT_PROG=echo
	fi
    fi
    ${GETTEXT_PROG} "$@"
}

gettext "XXXXXXXXXXXX"
gettext "ZZZZZZZZZZZZ"
gettext "CCCCCCCCCCCC"
-------->8------------------

Of course copy-n-pasting it to even few ecryptfs-utils's scripts looks
not good, the better way if each script will source some 'common' one
which has this gettext function. Otherwise, the better if gettext-tiny
installs one for target because it may work w/o changing ecryptfs-utils,
and it will work for other packages which may use gettext tool.

So I will start with ecryptfs-utils.

Regards,
Vadim Kochan
