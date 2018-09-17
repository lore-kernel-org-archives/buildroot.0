From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 17 Sep 2018 16:21:48 -0500
Subject: [Buildroot] [PATCH v7 0/4] Hardening Wrapper Updates and Test
Message-ID: <1537219312-59962-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series looks to update the implementation and migration of
hardening related options to the compiler wrapper.

The series also provides runtime testing for RELRO/SSP/FORTIFY.

Overall test of features
-------------------------------------
support/testing/run-tests -k -o ~/runtime_test_tmp -d ~/dl_tmp \
 tests.core.test_hardening.TestFortifyConserv \
 tests.core.test_hardening.TestFortifyNone \
 tests.core.test_hardening.TestRelro \
 tests.core.test_hardening.TestRelroPartial \
 tests.core.test_hardening.TestSspNone \
 tests.core.test_hardening.TestSspStrong

Changes
--------------------------------------------------
v6 -> v7
 - Fixed a last minute endif rebase bug in the v6 series

v5 -> v6
 - Moved all RELRO/PIE handling to GCC frontend wrapper.
 - Updated PIE disable conditions and added comments
 - Updated comments in code and on patches to make design choices
   clear

v4 -> v5
 - RELRO patch updated to handle link time -r represented also as
   -wl,r

v3 -> v4
 - RELRO/PIE patch updated to solely use the wrapper.  I didn't
   understand how the specfiles where used and thought I needed to
   do something similar during the use of LD.  That is not the case.
   GCC compile wrapper has been updated to handle CC and LD options
   required for this feature.  Testing with verification using the
   checksec tool confirms the intended behavior is close to identical
   between the specfile approach and wrapper.  Wrapper actually is
   just slightly better since the specfile relied on FLAGS being
   correctly used.

v2 -> v3
 - Realized the complexity of having a link wrapper application vs
   using a combo of link specfile and GCC wrapper.  This patchset
   presents that hybrid approach and has updated comments on the
   patches implementing this concept to support the discussion.
 - Added additional detail to descriptions and test cases to this
   cover letter

v1 -> v2
 - There were issues when I started regression testing where
   packages where providing multiple pie/pic/shared args on
   a single call of gcc/ld.

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
CC: Jan Kundr?t <jan.kundrat@cesnet.cz>
CC: Stefan S?rensen <stefan.sorensen@spectralink.com>

Matt Weber (4):
  toolchain/toolchain-wrapper: add BR2_RELRO_
  toolchain/toolchain-wrapper: add BR2_SSP_* support
  BR2_FORTIFY*: toolchain wrapper limitation note
  support/testing/tests/core: SSP & hardening flags

 .gitlab-ci.yml                               |   6 ++
 package/Makefile.in                          |  28 +++----
 support/testing/tests/core/test_hardening.py | 110 +++++++++++++++++++++++++++
 toolchain/toolchain-wrapper.c                |  91 +++++++++++++++++++++-
 toolchain/toolchain-wrapper.mk               |  14 ++++
 5 files changed, 228 insertions(+), 21 deletions(-)
 create mode 100644 support/testing/tests/core/test_hardening.py

-- 
1.9.1
