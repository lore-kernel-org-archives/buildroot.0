From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  6 Dec 2014 12:13:54 +0100
Subject: [Buildroot] [PATCH 4/9 v2] pkg-infra: add support for GitHub as a
	forge
In-Reply-To: <cover.1417863715.git.yann.morin.1998@free.fr>
References: <cover.1417863715.git.yann.morin.1998@free.fr>
Message-ID: <6c9c989b7b9f384e400786d17b6251708c07edc2.1417863715.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Our github helper currently uses a download scheme that is not
guaranteed to be stable over the long run. So, we have a github helper
that generates the correct _SITE value, so we can change it in a single
place, rather than touch all the packages.

This URL scheme is not stable, but GitHub publishes an API for dealing
with the content hosted on GitHub:
    https://developer.github.com/v3/

This API defines a stable end-point for downloading any abitrary commit
from a repository:
    https://developer.github.com/v3/repos/contents/#get-archive-link

    GET /repos/:owner/:repo/:archive_format/:ref

Switching to using the API implies we can no longer use the github
helper, because all it can do is only return an URL. But the way the
GitHub API works means we have to set both FOO_UPSTREAM_SOURCE and
FOO_SITE for a package, because the remote name is only $(FOO_VERSION).

The only way to continue using our github helper would be to make it
generate Makefile code to set two variables. This is not nice, as this
would be the only thing in the package infra to rely on generating
Makefile code.

Also, the API is rate-limited, and allows only 60 un-authenticated
requests per hour. This is not acceptable for Buildroot, as a user may
well select more than 60 packages coming from GitHub (we currently have
111 GitHub-hosted packages).

Also, some other forges (like Gitorious, Google code...) may need a
download scheme that is closer to the GitHub API scheme (Gitorious) than
what we currently have with _SOURCE and _SITE, and thus require the use
of _UPSTREAM_SOURCE as well.

Introduce a "forge" as a new concept for specifying the upstream
location, whereby the package can tell the type of forge and the
forge-related path of the repository. This is in turned interpreted by
the package infrastructure, which uses it to internally set the
appropriate variables to the appropriate values:

    FOO_FORGE = forge-name
    FOO_FORGE_PATH = user/repository

This patch introduces GitHub as the first such "forge" we support.
Packages will be converted over in a subsequent patch.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-generic.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 30bce59..dd67b51 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -353,6 +353,12 @@ ifneq ($$($(2)_OVERRIDE_SRCDIR),)
 $(2)_VERSION = custom
 endif
 
+ifndef $(2)_SITE
+ifeq ($$($(2)_FORGE),github)
+$(2)_SITE = https://github.com/$$($(2)_FORGE_PATH)/archive/$$($(2)_VERSION)
+endif # github
+endif
+
 ifndef $(2)_SOURCE
  ifdef $(3)_SOURCE
   $(2)_SOURCE = $$($(3)_SOURCE)
-- 
1.9.1
