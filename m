From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Oct 2015 07:56:43 +0100
Subject: [Buildroot] [Bug 8206] mplayer uses host xorg development files
In-Reply-To: <1443806071553-113718.post@n4.nabble.com>
References: <bug-8206-163@https.bugs.busybox.net/>
 <20150707210059.917A78015E@busybox.osuosl.org>
 <1436622071664-105281.post@n4.nabble.com> <55A12A5E.4010900@mind.be>
 <1436625379066-105305.post@n4.nabble.com> <55A1359C.5020109@mind.be>
 <20150711173913.32fbc8a7@free-electrons.com> <55A13972.2060908@mind.be>
 <1443806071553-113718.post@n4.nabble.com>
Message-ID: <560F7C2B.5070608@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02-10-15 18:14, glscantlen wrote:
> I realize this is an old thread, but it appears the issue was not resolved
> and I have a solution that works for my defconfig on both 2015.05 & .08.
> 
> The most recent version I have tested is snapshot 2015.08 from
> git.buildroot.net
> on Sept.30. That version has exhibited the same issue as previous versions
> noted in this thread "mplayer uses host xorg development files"
> 
> The solution I am using is described here:
>     - Fix a bug in the mplayer's .mk file. Add Buildroot's path
>       for staging to mplayer's configuration, ~ line 259
>        $ nano -w package/mplayer/mplayer.mk
>           --extra-cflags="$(MPLAYER_CFLAGS) -I$(STAGING_DIR)/usr/include" \
>           --extra-ldflags="$(MPLAYER_LDFLAGS) -L$(STAGING_DIR)/usr/lib" \

 I've done a few tests with the PARANOID handling to detect a problem here, but
couldn't find any. However, I do notice in the configure script that it will
happily search for headers in /usr/include, but AFAICS without actually adding
/usr/include to the search path. Explicitly adding $(STAGING_DIR)/usr/include
will work because then configure will look for the header file in that place.
The ldflags addition shouldn't be needed however.

 Now, the problem in your case seems to be that you don't have
BR2_PACKAGE_XLIB_LIBXV selected, which means that there will be no useful X11
support included. And indeed, the logs you posted earlier show that mplayer is
using the framebuffer instead of X11.


 That said, I guess the mplayer package could really use some love to properly
deal with all the silliness in its configure script.


 Regards,
 Arnout

> 
> 
> 
> 
> --
> View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Bug-8206-New-mplayer-uses-host-xorg-development-files-tp104861p113718.html
> Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
