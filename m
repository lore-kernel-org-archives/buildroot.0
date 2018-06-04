From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Jun 2018 21:59:55 +0200
Subject: [Buildroot] [git commit] dl-wrapper: Fix support for URIs
 containing '+'
Message-ID: <20180604195819.0165983860@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5ba72946ebf597a163bae9b12453dfa68993d54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
