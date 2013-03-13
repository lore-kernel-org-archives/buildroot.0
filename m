From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Mar 2013 21:46:00 +0100
Subject: [Buildroot] question about my pevious dhcpcd patch
In-Reply-To: <1363199449.8204.157.camel@genx.eng.msli.com>
References: <1363199449.8204.157.camel@genx.eng.msli.com>
Message-ID: <5140E588.8070208@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/13/13 19:30, John Stile wrote:
> I have an update to my patch to add dhcpd.
>
> First issue: I discovered I also need to copy a script directory, but
> don't see a good method to copy more than each file one at a time.
>
> Is there a good way to copy all files in dhcpcd-hooks except the
> Makefile, into $(TARGET_DIR)/libexec/dhcpcd-hooks?
>
> Right now I'm doing it one at a time like this:
> 	$(INSTALL) -D -m 0755 \
> 		$(@D)/dhcpcd-hooks/01-test \
> 		$(TARGET_DIR)/libexec/dhcpcd-hooks/01-test
> 	$(INSTALL) -D -m 0755 \
> 		$(@D)/dhcpcd-hooks/02-dump \
> 		$(TARGET_DIR)/libexec/dhcpcd-hooks/02-dump
> 	$(INSTALL) -D -m 0755 \
> 		$(@D)/dhcpcd-hooks/20-resolv.conf \
> 		$(TARGET_DIR)/libexec/dhcpcd-hooks/20-resolv.conf
> 	$(INSTALL) -D -m 0755 \
> 		$(@D)/dhcpcd-hooks/29-lookup-hostname \
> 		$(TARGET_DIR)/libexec/dhcpcd-hooks/29-lookup-hostname

  Just do
	mkdir -p $(TARGET_DIR)/libexec/dhcpcd-hooks
	cp $(@D)/dhcpcd-hooks/* $(TARGET_DIR)/libexec/dhcpcd-hooks

  If permissions of the original files are wrong, just add a chmod.

  By the way, we don't have a /libexec at the moment, but we do have a 
/usr/libexec. So I would put it there.

>    ...etc...
>
> Second issue:  how do I submit an updated patch?  The first one was
> submitted a few days ago.  Do i just do a fresh clone, and then try to
> add my stuff and submit via send-email, and pretend the first patch was
> never sent?

  Assuming your patch is in git, you can make more changes, and then 
update your patch with "git commit --amend". Then you can just use git 
send-email like before.

  If you have made other changes in the mean time, you can commit your 
changes and squash them with the patch with 'git rebase -i origin/master'

  Also make sure you update your git repository with 'git pull --rebase'

  Regards,
  Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
