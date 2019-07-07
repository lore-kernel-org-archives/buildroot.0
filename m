From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Jul 2019 08:33:55 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/meson: fix empty
 arguments in cross-compilation.conf
Message-ID: <20190707063317.D76ED821BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=721208a87182dfa00b163c90af5ea7e13de764fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

When TARGET_CFLAGS (or _LDFLAGS or _CXXFLAGS) are empty, but were
constructed by appending other variables, like:

    TARGET_CFLAGS = $(SOMETHING) $(SOMETHING_ELSE)

and both variables are empty, then $(TARGET_CFLAGS) is _not_ the
null-string; it's value is a string made of a single space.

This means that the construct:

    $(if $(TARGET_CFLAGS),true,false)

will in fact return 'true'.

In our case, it means that we will call:

    `printf '"%s", ' `

which expands to just:

    "",

which we are then happy to insert as-is in the generated
cross-compilation.conf.

Then meson, will happily call the compiler with an empty argument.

The compiler is less happy, though:

    arm-none-linux-gnueabi-gcc: error: : No such file or directory

And this is not even trivial to debug either... The only clue being that
there seems to be something missing between ': :'

We fix that testing the $(strip)ed value. We can still pass the
non-$(strip) expansion, because the shell will just do it for us, and we
are then sure there is at least one non-blank word in there.

Thanks a lot to Adam for his invaluable help debugging this!

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit e9de6d9e0ac66883b9c8b7b4c623b27dab8087ab)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/meson/meson.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index d76541cc93..71bdadf825 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -45,9 +45,9 @@ else
 HOST_MESON_TARGET_CPU_FAMILY = $(ARCH)
 endif
 
-HOST_MESON_SED_CFLAGS = $(if $(TARGET_CFLAGS),`printf '"%s"$(comma) ' $(TARGET_CFLAGS)`)
-HOST_MESON_SED_LDFLAGS = $(if $(TARGET_LDFLAGS),`printf '"%s"$(comma) ' $(TARGET_LDFLAGS)`)
-HOST_MESON_SED_CXXFLAGS = $(if $(TARGET_CXXFLAGS),`printf '"%s"$(comma) ' $(TARGET_CXXFLAGS)`)
+HOST_MESON_SED_CFLAGS = $(if $(strip $(TARGET_CFLAGS)),`printf '"%s"$(comma) ' $(TARGET_CFLAGS)`)
+HOST_MESON_SED_LDFLAGS = $(if $(strip $(TARGET_LDFLAGS)),`printf '"%s"$(comma) ' $(TARGET_LDFLAGS)`)
+HOST_MESON_SED_CXXFLAGS = $(if $(strip $(TARGET_CXXFLAGS)),`printf '"%s"$(comma) ' $(TARGET_CXXFLAGS)`)
 
 # Generate a Meson cross-compilation.conf suitable for use with the
 # SDK
