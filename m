From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 07 Sep 2020 13:30:33 +0000
Subject: [Buildroot] [Bug 13181] New: libopenssl package enables Cryptodev
 engine even if BR2_PACKAGE_LIBOPENSSL_ENGINES is disabled
Message-ID: <bug-13181-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13181

            Bug ID: 13181
           Summary: libopenssl package enables Cryptodev engine even if
                    BR2_PACKAGE_LIBOPENSSL_ENGINES is disabled
           Product: buildroot
           Version: 2020.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: bradley.gamble at ncipher.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

OpenSSL builds a number of seperate engines that provide cryptographic API and
hardware offload support. This is currently configured from Buildroot via the
BR2_PACKAGE_LIBOPENSSL_ENGINES option.

Previously disabling this option would remove these engines from the completed
filesystem, disabling their use. However, recent versions of OpenSSL build the
devcrypto engine in to libcrypto as default, rather than as a dynamic library.
This can lead to Cryptodev being used even if it was not intended.

The libopenssl.mk file currently checks if BR2_PACKAGE_HAS_CRYPTODEV is set and
will enable the Cryptodev engine via the "enable-devcryptoeng" configure flag
if true. This is a manual override as all the other engines can be specified in
a similar manner (ie enable-afalgeng) but Buildroot seems to imply that
enabling the Cryptodev Package should also force OpenSSL to use it (which is
incorrect).

OpenSSL's Cryptodev engine should either be overridden by the additional
engines option (disabling it if BR2_PACKAGE_LIBOPENSSL_ENGINES is not set) or
should be a manual override due to it's ability to be built statically in to
libcrypto.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
