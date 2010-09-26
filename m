From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 Sep 2010 00:04:09 +0200
Subject: [Buildroot] [PATCH 05/18] boa: convert to autotargets
In-Reply-To: <AANLkTimBPViR_b9ZdSG7Q_WTCiGt2DarLcmcsWfyUB6J@mail.gmail.com>
	(Martin Banky's message of "Sun, 26 Sep 2010 14:22:49 -0700")
References: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
	<1285485249-29212-5-git-send-email-Martin.Banky@gmail.com>
	<87sk0w46v4.fsf@macbook.be.48ers.dk>
	<AANLkTimBPViR_b9ZdSG7Q_WTCiGt2DarLcmcsWfyUB6J@mail.gmail.com>
Message-ID: <87y6ao2mcm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Banky <Martin.Banky@gmail.com> writes:

 Martin> Peter,
 Martin> ???? Sorry, I missed that when I was putting the patch set together. I meant to
 Martin> merge the two, when I was cherry picking them into a new branch. It was the end
 Martin> of my night when I put this together.

No problem.

 Martin> One question, does the stripping happen automatically for
 Martin> gentargets? I was under the impression that you had to specify
 Martin> it. I'm still trying to get a grasp on all the different things
 Martin> that happen behind the scenes.

Yes, it happens globally just before building the filesystems in the
toplevel Makefile:

target-finalize:
ifeq ($(BR2_HAVE_DEVFILES),y)
	( scripts/copy.sh $(STAGING_DIR) $(TARGET_DIR) )
else
	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/aclocal
	find $(TARGET_DIR)/lib \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
	find $(TARGET_DIR)/usr/lib \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
endif
ifneq ($(BR2_PACKAGE_GDB),y)
	rm -rf $(TARGET_DIR)/usr/share/gdb
endif
ifneq ($(BR2_HAVE_DOCUMENTATION),y)
	rm -rf $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/man
	rm -rf $(TARGET_DIR)/usr/info $(TARGET_DIR)/usr/share/info
	rm -rf $(TARGET_DIR)/usr/doc $(TARGET_DIR)/usr/share/doc
	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
endif
	find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true

-- 
Bye, Peter Korsgaard
