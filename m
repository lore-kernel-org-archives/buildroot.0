From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Wed, 16 Feb 2011 15:01:34 +0100
Subject: [Buildroot] [PATCH] Makefile: improve $(TARGET_DIR) (re)creation
In-Reply-To: <AANLkTikvPodMe8ZGmo452Zn_hBU5c2S=2RpMNYKOoMAP@mail.gmail.com>
References: <1297627745-17087-1-git-send-email-bjorn.forsman@gmail.com>
	<AANLkTi==jLjhNbswUC1wsgUySjB_kM_7VD1Ns9mQoMsE@mail.gmail.com>
	<AANLkTikvPodMe8ZGmo452Zn_hBU5c2S=2RpMNYKOoMAP@mail.gmail.com>
Message-ID: <AANLkTi=jtfZmP=BqvhxoQxLLRyFpj0p3=Z_b0WguBu_y@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15 February 2011 13:10, Daniel Nystr?m
<daniel.nystrom@timeterminal.se> wrote:
> 2011/2/15 Bj?rn Forsman <bjorn.forsman@gmail.com>:
>> 2011/2/13 Bj?rn Forsman <bjorn.forsman@gmail.com>:
>>> This patch fixes the following use case:
>>>
>>> ?1. Build, hack, ...
>>> ?2. Oh no, $(TARGET_DIR) is no longer in sync with $(TARGET_SKELETON)
>>> ? ?and/or the packages selected in menuconfig. If only there was a way
>>> ? ?to *easily* rebuild $(TARGET_DIR) so it is in sync...
>>>
>>> With this patch, just remove $(TARGET_DIR) and Buildroot will recreate
>>> it.
>>>
>>> Main changes:
>>> ?* Always copy $(TARGET_SKELETON). This is the easiest way to ensure
>>> ? $(TARGET_DIR) has the latest skeleton.
>>> ?* If $(TARGET_DIR) needs to be created (i.e. if the directory is
>>> ? missing), remove $(BUILD_DIR)/*/.stamp_target_installed files so
>>> ? all currently selected packages will be reinstalled.
>>
>> I just realized that linux.mk also needs patching for TARGET_DIR
>> rebuild (to ensure kernel modules are installed). But before I post
>> that I'd like to get some feedback on this approach...ack/nak?
>
> I'm afraid I can't say anything about this particular approach (I
> don't even have time to test it right now) but I do would love a way
> to regenerate the target dir.

It's good to know I'm not the only one wanting this :-)

I just runtime tested this and got:

  target> ls
  ls: can't load library 'libgcc_s.so.1'

The fix seems to be `rm -f $(STAMP_DIR)/gcc_libs_target_installed`.
I'll add it in the next version.

Best regards,
Bj?rn Forsman
