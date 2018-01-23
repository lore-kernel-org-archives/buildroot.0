From: Toan Pham <tpham3783@gmail.com>
Date: Tue, 23 Jan 2018 13:28:34 -0500
Subject: [Buildroot] Suggestion for Makefile to probably import
 BR2_CONFIG
In-Reply-To: <d7cd5dae-5ae3-54f3-4376-f17c27e98065@mind.be>
References: <CAGNmLEM_x8ykDr54gbT94em9YyH5+0ec=jCgjULh68yJLUzjnw@mail.gmail.com>
 <1cb3ee33-b12f-6534-9dbf-fb697fbf3482@mind.be>
 <CAGNmLEMn=NFuq+iKj8e2PuF-A4+tGj_VDjq1FBj6+xzDPU=_iQ@mail.gmail.com>
 <d7cd5dae-5ae3-54f3-4376-f17c27e98065@mind.be>
Message-ID: <CAGNmLEN0N9NziMj6OUDEAkEhu6bDmc43jBnXV6MFSP3EEupnSg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
>  Well, if you really know what you are doing, then you also know that you
> can in
> fact override BR2_CONFIG :-).


Yes, but it wont work if the build is out of branch (O is defined) along
with BR2_CONFIG.  Please try it out!



> In fact, the commandline you give in your original
> mail *will* work. Any assignment specified on the make commandline (after
> 'make') overrides the assignments done within the Makefiles.
>


Yes, except that it doesn't work because  BR2 would print the error
described in the first email.  I just found the proper patch to fix that
error (see below patch).  The reason why we got the error because buildroot
called submake target silentoldconfig without passing along the BR2_CONFIG
we intended to use.  One way to fix that is to pass -e option to submake
but it is a bad practice to use environment variable overload.  A better
way is to pass along BR2_CONFIG, otherwise submake would evaluate
BR2_CONFIG as $(CONFIG_DIR)/.config as oppose to the path given from
command line argument.  Please review it and let me know.


Thanks for the feedback,

TP




diff --git a/Makefile b/Makefile
index 7d8ab51..4b12359 100644
--- a/Makefile
+++ b/Makefile
 # Pull in the user's configuration file
@@ -547,7 +550,7 @@ dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
        $(HOST_DIR) $(HOST_DIR)/usr $(HOST_DIR)/lib $(BINARIES_DIR)

 $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
-       $(MAKE1) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)"
HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
+       $(MAKE1) BR2_CONFIG=$(BR2_CONFIG) $(EXTRAMAKEARGS)
HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180123/f5b9838d/attachment.html>
