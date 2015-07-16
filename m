From: Emeric Vigier <emeric.vigier@savoirfairelinux.com>
Date: Thu, 16 Jul 2015 11:15:49 -0400
Subject: [Buildroot] [PATCH v3 1/1] Makefile: add target to clean
	targetfs
In-Reply-To: <55A5859B.2010809@savoirfairelinux.com>
References: <1425947100-9031-1-git-send-email-emeric.vigier@savoirfairelinux.com>
 <1430095555-8484-1-git-send-email-emeric.vigier@savoirfairelinux.com>
 <553DF343.8010400@andin.de> <55A5859B.2010809@savoirfairelinux.com>
Message-ID: <55A7CAA5.5020502@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> Another problem that showed up was that some of the package install
>> steps dont seem separated very well. E.g. qt5 examples copies everything
>> from a certain staging-dir/* to target/..
>> A later qt5 module also creates files in that staging-dir, so next round
>> there's more files in target.
>>
>> I realize this is due to my way of not deleteing the staging dir any
>> longer - I used to in the beginning. If I recall correctly this is
>> because I noticed some packages copy files into staging/ during compile
>> and these files are then missing after a reinstall. I'm not entirely
>> sure though.
>
> I enabled qt4 and compare the targetfs after a target-clean, no
> differences:
>
> $ rsync -rvncl --delete --exclude '*.pyc' --exclude '*.pyo' --exclude
> 'tmp/ldconfig/aux-cache' output/target/ output/target.orig.qt4/
> sending incremental file list
>
> sent 15,095 bytes  received 62 bytes  30,314.00 bytes/sec
> total size is 16,028,992  speedup is 1,057.53 (DRY RUN)
>
> With what QT configs did you meet problems specifically?

Qt4 showed no difference in the targetfs.

I disabled Qt4 and enabled Qt5 with several modules and saw no 
differences in targetfs either. Here is my Qt5 config:

   http://pastie.org/10296840

I had to switch from a buildroot toolchain to a Linaro-gcc-4.9 toolchain 
to build Qt5. I haven't enabled Qt5-webkit because I fell into this 
GCC-4.9 bug: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61207.

>> So my question is, in your approach, are you certain the re-installed
>> staging/ is the same as the original for all packages? Maybe you can run
>> some comparison like my rsync line for staging as well.

I only delete staging symlink, not the sysroot content. This patch does 
not aim at fixing the black magic that some packages may be doing 
between the staging dir and the target dir, just recreating the targetfs.

So the only improvement I have in mind for this patch is this:

         rm -rf $(TARGET_DIR) $(STAGING_DIR) $(BUILD_DIR)/.root \
-         $(BUILD_DIR)/*/.stamp_target_installed 
$(BUILD_DIR)/*/.stamp_staging_installed
+         $(BUILD_DIR)/*/.stamp_target_installed 
$(BUILD_DIR)/*/.stamp_staging_installed \
+         $(BUILD_DIR)/host-gcc-final-*/.stamp_host_installed

Do you have other things in mind?

>> regards,
>> Andreas
>
> thanks,
> --
> Emeric

Emeric
