From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  4 Jun 2015 17:12:53 +0000 (UTC)
Subject: [Buildroot] [Bug 8156] pkg-kconfig infra broken for
	*-update-{config, defconfig}
In-Reply-To: <bug-8156-163@https.bugs.busybox.net/>
References: <bug-8156-163@https.bugs.busybox.net/>
Message-ID: <20150604171253.C5CD98041A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8156

--- Comment #3 from Yann E. MORIN <yann.morin.1998@free.fr> 2015-06-04 17:12:53 UTC ---
Thomas,

> I'm a bit confused. On the bug report, you say that you cannot reproduce,
> but on IRC, you were apparently saying that you could reproduce and that
> it wasn't indeed a use case that hadn't been planned.

Well, I first did a quick review of the code, on which I reported on
IRC. That led me thinking it was indeed broken.

Then I actually tested your use-case, and was not able to reproduce.

Sorry for the confusion. I stand by the comment I made here on the
tracker: I can not reproduce, and I can't see why it is broken.

So, let's look at the code (after partially expanding variables in
package/pkg-kconfig.mk); we have this dependency chain:

    .PHONY: linux-update-config linux-savedefconfig

    linux-update-config: linux-savedefconfig

    linux-savedefconfig: $(LINUX_DIR)/.stamp_kconfig_fixup_done

    $(LINUX_DIR)/.stamp_kconfig_fixup_done: $(LINUX_DIR)/.config

    $(LINUX_DIR)/.config: $(LINUX_KCONFIG_FILE)

So in your case:

  - $(LINUX_KCONFIG_FILE) initially points to the bundled defconfig
    file, and the dependency chain is satisfied;

  - then you change it to point to an arbitrary filename, and the
    dependency chain is now broken, because that file does not yet
    exist;

  - but (because linux-update-config and linux-savedefconfig are .PHONY?)
    it is not a problem for make; at least it is not for my make-3.81.

What's your make version?

> Who should I trust? The y_morin on IRC, or the Yann E. Morin in the bug
> tracker ? :-)

Eh! ;-)

Regards,
Yann E. MORIN.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
