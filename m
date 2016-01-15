From: Joao Mano <joao@datacom.ind.br>
Date: Fri, 15 Jan 2016 18:13:15 -0200
Subject: [Buildroot] [PATCH v2] support/download: Aternative access methods
	to CVS
In-Reply-To: <1452862510-31390-1-git-send-email-joao@datacom.ind.br>
References: <1452862510-31390-1-git-send-email-joao@datacom.ind.br>
Message-ID: <1452888795-14158-1-git-send-email-joao@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allows user to specify other access methods than
:pserver:anonymous@ on CVS repositories.

This shall be specifically defined along MODULE_SITE string.

Signed-off-by: Joao Mano <joao@datacom.ind.br>

---
Changes v1 -> v2:
 - Documentation improved with examples. (Thomas Petazzoni suggestion)

Signed-off-by: Joao Mano <joao@datacom.ind.br>
---
 docs/manual/adding-packages-generic.txt | 7 ++++++-
 support/download/cvs                    | 8 +++++++-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 1c25c4e..1f9c7bb 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -279,7 +279,12 @@ information is (assuming the package name is +libfoo+) :
   ** +cvs+ for retrieving source code from a CVS repository.
      Used by default when +LIBFOO_SITE+ begins with +cvs://+.
      The downloaded source code is cached as with the +svn+ method.
-     Only anonymous pserver mode is supported.
+     Anonymous pserver mode is assumed otherwise explicitly defined
+     on +LIBFOO_SITE+. Both
+     +LIBFOO_SITE=cvs://libfoo.net:/cvsroot/libfoo+ and
+     +LIBFOO_SITE=cvs://:ext:libfoo.net:/cvsroot/libfoo+
+     are accepted, on the former anonymous pserver access mode is
+     assumed.
      +LIBFOO_SITE+ 'must' contain the source URL as well as the remote
      repository directory. The module is the package name.
      +LIBFOO_VERSION+ is 'mandatory' and 'must' be a tag, a branch, or
diff --git a/support/download/cvs b/support/download/cvs
index e1d5035..b4e947a 100755
--- a/support/download/cvs
+++ b/support/download/cvs
@@ -40,8 +40,14 @@ else
     select="-r"
 fi
 
+# The absence of an initial : on ${repo} means access method undefined
+if [[ ${repo} == [^:]* ]]; then
+   # defaults to anonymous pserver
+   repo=":pserver:anonymous@${repo}"
+fi
+
 export TZ=UTC
-_cvs ${verbose} -z3 -d"':pserver:anonymous@${repo}'" \
+_cvs ${verbose} -z3 -d"'${repo}'" \
      co -d "'${basename}'" ${select} "'${rev}'" -P "'${rawname}'"
 
 tar czf "${output}" "${basename}"
-- 
1.9.1
