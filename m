From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Jul 2017 10:54:39 +0200
Subject: [Buildroot] [git commit] python-json-schema-validator: needs
	versiontools on the host
Message-ID: <20170713085046.9DF7B82151@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3921001a9b31a195fd323b7596e9e3c0f412faf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-json-schema-validator does not need versiontools on the target,
but only on the host, as it's listed in setup_requires in setup.py.

This was not noticed so far because host Python interpreter is started
with a PYTHONPATH that contains a directory with target Python
packages, so versiontools was found there. But as we are about to fix
PYTHONPATH to no longer include such a directory,
python-json-schema-validator would fail due to versiontools being
missed on the host.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-json-schema-validator/Config.in                       | 1 -
 package/python-json-schema-validator/python-json-schema-validator.mk | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-json-schema-validator/Config.in b/package/python-json-schema-validator/Config.in
index dbc5328..e50e8ee 100644
--- a/package/python-json-schema-validator/Config.in
+++ b/package/python-json-schema-validator/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_JSON_SCHEMA_VALIDATOR
 	bool "python-json-schema-validator"
-	select BR2_PACKAGE_PYTHON_VERSIONTOOLS
 	help
 	  JSON Schema Validator
 
diff --git a/package/python-json-schema-validator/python-json-schema-validator.mk b/package/python-json-schema-validator/python-json-schema-validator.mk
index 6accbd6..c0a335c 100644
--- a/package/python-json-schema-validator/python-json-schema-validator.mk
+++ b/package/python-json-schema-validator/python-json-schema-validator.mk
@@ -9,6 +9,6 @@ PYTHON_JSON_SCHEMA_VALIDATOR_SOURCE = json-schema-validator-$(PYTHON_JSON_SCHEMA
 PYTHON_JSON_SCHEMA_VALIDATOR_SITE = https://pypi.python.org/packages/70/46/ba39cb7efad1898cfc89bf3588b8612f24d128f1c25b761994f524a59cef
 PYTHON_JSON_SCHEMA_VALIDATOR_LICENSE = LGPL-3.0
 PYTHON_JSON_SCHEMA_VALIDATOR_SETUP_TYPE = setuptools
-PYTHON_JSON_SCHEMA_VALIDATOR_DEPENDENCIES = python-versiontools
+PYTHON_JSON_SCHEMA_VALIDATOR_DEPENDENCIES = host-python-versiontools
 
 $(eval $(python-package))
