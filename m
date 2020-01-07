From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Jan 2020 18:36:15 +0100
Subject: [Buildroot] [git commit] package/libselinux: fix python module
 install patch
Message-ID: <20200107172650.D1A608345B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5a45d499eb0c5f0bca24fa92325fdceef5903e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 2768a0eb4 (package/libselinux: add dependency on
host-coreutils for ln --relative), we dropped a previous patch
which touched the same line, so the python module install patch
no longer applies.

Rather than drop use of ln --relative, which we now have (and
which was all that fuss was for), just drop the use of the PYCEXT
use altogether.

Fixes:
  - http://autobuild.buildroot.org/results/c8f/c8fe5b47e422bac13b4d5fa10bd1ee5218021585/ (host)
  - http://autobuild.buildroot.org/results/402/4026a34c6c096354ba99e8c202210428fa2795d2/ (target)

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
reviewed-by: Adam Duskett <aduskett@gmail.com>
---
 .../0006-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libselinux/0006-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch b/package/libselinux/0006-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
index 57cc151e70..c960e1db7e 100644
--- a/package/libselinux/0006-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
+++ b/package/libselinux/0006-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
@@ -37,8 +37,8 @@ index 799df2b0..95684ed7 100644
  install-pywrap: pywrap
  	$(PYTHON) setup.py install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR)`
  	install -m 644 $(SWIGPYOUT) $(DESTDIR)$(PYTHONLIBDIR)/selinux/__init__.py
--	cd $(DESTDIR)$(PYTHONLIBDIR) && ln -sf selinux/_selinux$(PYCEXT) _selinux$(PYCEXT)
-+	cd $(DESTDIR)$(PYTHONLIBDIR) && ln -sf selinux/_selinux*.so .
+-	ln -sf --relative $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux$(PYCEXT) $(DESTDIR)$(PYTHONLIBDIR)/_selinux$(PYCEXT)
++	ln -sf --relative $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux*.so $(DESTDIR)$(PYTHONLIBDIR)/
  
  install-rubywrap: rubywrap
  	test -d $(DESTDIR)$(RUBYINSTALL) || install -m 755 -d $(DESTDIR)$(RUBYINSTALL) 
