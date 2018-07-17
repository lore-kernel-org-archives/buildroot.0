From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Jul 2018 09:10:08 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] dl-wrapper: Fix support
 for URIs containing '+'
Message-ID: <20180717072759.99D2488706@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6eddb997357e5afd5a0af524fa638ccecbff1d30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

'+' is a valid character in a url. The current dl-wrapper gets the
URI scheme by dropping everything after the last '+' character, with
the intension of finding 'git' from e.g. 'git+https://uri'.

If a uri has a '+' anywhere in it, it ends up using too much of the
string as a scheme, and fails to match the handler properly.

An example of where this form of URI is used is when using deploy tokens
in gitlab. It uses a form like https://<username>:<password>@gitlab.com/<group>/<repo.git>
where username for deploy token is of the form 'gitlab+deploy-token-<number>'.

Use the %% operator to search backwards until the last '+' character when
dropping the rest of the string as we know that the first '+'
in the string should be the scheme.

Signed-off-by: Robert Beckett <bbeckett@netvu.org.uk>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a5ba72946ebf597a163bae9b12453dfa68993d54)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/download/dl-wrapper | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 8d6365e08d..4059c37ebc 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -88,7 +88,7 @@ main() {
     download_and_check=0
     rc=1
     for uri in "${uris[@]}"; do
-        backend=${uri%+*}
+        backend=${uri%%+*}
         case "${backend}" in
             git|svn|cvs|bzr|file|scp|hg) ;;
             *) backend="wget" ;;
