From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 15 Jul 2012 02:28:56 +0200
Subject: [Buildroot] [PATCH 1/1] skeleton: add default login port to
	/etc/securetty
In-Reply-To: <20120715010848.0290501a@skate>
References: <1342149545-10417-1-git-send-email-roylee17@gmail.com>
 <5001A4D3.1030802@mind.be> <20120714191530.539ca71c@skate>
 <5001E2B2.6070509@mind.be> <20120715010848.0290501a@skate>
Message-ID: <50020EC8.3040002@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/15/12 01:08, Thomas Petazzoni wrote:
> Le Sat, 14 Jul 2012 23:20:50 +0200,
> Arnout Vandecappelle<arnout@mind.be>  a ?crit :
>
> >    I wouldn't like that.  I often use the default skeleton but override e.g.
> > inittab in the post-build script.  I can't be bothered with setting
> > BR2_TARGET_GENERIC_GETTY_PORT to empty.  So the result is
> > that a /etc/securetty would be created which bears no relation with
> > the actual login ports defined in inittab...  And all this happens on the
> > sly, without any consent from the user or warning in the config menus.
> >
> >    Bottom line: automatically adding BR2_TARGET_GENERIC_GETTY_PORT
> > to securetty is OK for me, but emptying it is not.
>
> Hmm, ok. But if you're modifying the inittab through a post-build
> script, we could also say that it's your responsibility to also
> adjust /etc/securetty accordingly, no?

  Maybe, but if the securetty file isn't even part of the skeleton it's less
obvious.  But more importantly: people will send questions to the mailing
list asking why they can't log in into their buildroot system...

> I don't have a strong opinion here, just trying to find the right
> balance.
>
> >    BTW I can't think of many circumstances where securetty makes sense
> > on an embedded system to begin with: why would you allow shell login
> > on some port but not root login?
> Is removing /etc/securetty sufficient? Both for Busybox getty, the
> full-featured getty, and things like dropbear, openssh, telnet and al?
> I think telnet needs pts/[0-n] to be in /etc/securetty otherwise it
> doesn't allow root login.

  I did a search for securetty in a build of an allyesconfig, and only found it in
util-linux and busybox.  And I verified (by source code inspection) that util-linux
accepts an absent securetty.

  pam has a securetty module, but we don't support pam yet.  And anyway:
<http://git.fedorahosted.org/git?p=linux-pam.git;a=blob;f=modules/pam_securetty/pam_securetty.c;h=5f2d1bec32c98fe8e3cbf437aec105d8b28dcfc9;hb=HEAD#l113>  
if (stat(SECURETTY_FILE, &ttyfileinfo)) {
<http://git.fedorahosted.org/git?p=linux-pam.git;a=blob;f=modules/pam_securetty/pam_securetty.c;h=5f2d1bec32c98fe8e3cbf437aec105d8b28dcfc9;hb=HEAD#l114>      
pam_syslog(pamh, LOG_NOTICE, "Couldn't open %s: %m", SECURETTY_FILE);
<http://git.fedorahosted.org/git?p=linux-pam.git;a=blob;f=modules/pam_securetty/pam_securetty.c;h=5f2d1bec32c98fe8e3cbf437aec105d8b28dcfc9;hb=HEAD#l115>    
return PAM_SUCCESS; /* for compatibility with old securetty handling,
<http://git.fedorahosted.org/git?p=linux-pam.git;a=blob;f=modules/pam_securetty/pam_securetty.c;h=5f2d1bec32c98fe8e3cbf437aec105d8b28dcfc9;hb=HEAD#l116>                           
this needs to succeed.  But we still log the
<http://git.fedorahosted.org/git?p=linux-pam.git;a=blob;f=modules/pam_securetty/pam_securetty.c;h=5f2d1bec32c98fe8e3cbf437aec105d8b28dcfc9;hb=HEAD#l117>                           
error. */
<http://git.fedorahosted.org/git?p=linux-pam.git;a=blob;f=modules/pam_securetty/pam_securetty.c;h=5f2d1bec32c98fe8e3cbf437aec105d8b28dcfc9;hb=HEAD#l118>  
}

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
