From: Christian Stewart <christian@paral.in>
Date: Wed, 25 Nov 2020 12:45:59 -0800
Subject: [Buildroot] [PATCH next 05/12]
 support/download/go-post-process: implement Go vendoring support
In-Reply-To: <CA+h8R2rY05=7NZbOf+fU30qV+xdq0g2GhBpZSMBfg5uRm4x9XA@mail.gmail.com>
References: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
 <20201119213658.1232531-6-thomas.petazzoni@bootlin.com>
 <CA+h8R2rY05=7NZbOf+fU30qV+xdq0g2GhBpZSMBfg5uRm4x9XA@mail.gmail.com>
Message-ID: <CA+h8R2rQcCzEt6TtqjEHYMoJurXrqJQ=UsimFHBzg+1hzx9Q+g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,


On Wed, Nov 25, 2020 at 12:28 PM Christian Stewart <christian@paral.in> wrote:
> On Thu, Nov 19, 2020 at 1:37 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > This commit introduces the download post-process script
> > support/download/go-post-process, and hooks it into the Go package
> > infrastructure.
>
> This looks good. There's only one problem - if the package does not
> come with a go.mod file (which is the case with
> nvidia-container-toolkit).
>
> In this case we need to run the $(2)_GEN_GOMOD script before running
> the download post-process.

I was able to solve this with the following patch:

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index c914d016e2..29462ebaa4 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -112,6 +112,7 @@ define DOWNLOAD
  -o '$($(2)_DL_DIR)/$(notdir $(1))' \
  $(if $($(2)_DOWNLOAD_POST_PROCESS),-p '$($(2)_DOWNLOAD_POST_PROCESS)') \
  $(if $($(2)_GIT_SUBMODULES),-r) \
+ $(if $($(2)_GOMOD),-g '$($(2)_GOMOD)') \
  $(foreach uri,$(call DOWNLOAD_URIS,$(1),$(2)),-u $(uri)) \
  $(QUIET) \
  -- \
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 2d74554213..2fc530f24f 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -17,7 +17,7 @@
 # We want to catch any unexpected failure, and exit immediately.
 set -e

-export BR_BACKEND_DL_GETOPTS=":hc:d:o:n:N:H:ru:qf:e"
+export BR_BACKEND_DL_GETOPTS=":hc:d:g:o:n:N:H:ru:qf:e"

 main() {
     local OPT OPTARG
@@ -25,11 +25,12 @@ main() {
     local -a uris

     # Parse our options; anything after '--' is for the backend
-    while getopts ":c:d:D:o:n:N:H:rf:u:qp:" OPT; do
+    while getopts ":c:d:D:g:o:n:N:H:rf:u:qp:" OPT; do
         case "${OPT}" in
         c)  cset="${OPTARG}";;
         d)  dl_dir="${OPTARG}";;
         D)  old_dl_dir="${OPTARG}";;
+        g)  gomod_init="${OPTARG}";;
         o)  output="${OPTARG}";;
         n)  raw_base_name="${OPTARG}";;
         N)  base_name="${OPTARG}";;
@@ -138,6 +139,7 @@ main() {

         if [ -n "${post_process}" ] ; then
                 ${OLDPWD}/support/download/${post_process}-post-process \
+                         -g "${gomod_init}" \
                          -o "${tmpf}" \
                          -n "${raw_base_name}"
         fi
diff --git a/support/download/go-post-process b/support/download/go-post-process
index 01073aee8b..796fa08e38 100755
--- a/support/download/go-post-process
+++ b/support/download/go-post-process
@@ -5,8 +5,9 @@ set -e
 . $(dirname $0)/post-process-helpers

 # Parse our options
-while getopts "n:o:" OPT; do
+while getopts "n:g:o:" OPT; do
         case "${OPT}" in
+        g)  gomod_init="${OPTARG}";;
         o)  output="${OPTARG}";;
         n)  base_name="${OPTARG}";;
         :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
@@ -23,6 +24,10 @@ unpack ${base_name} ${output}

 # Do the Go vendoring
 pushd ${base_name} > /dev/null
+if [ -n "${gomod_init}" ]; then
+    # Note: does nothing if go.mod already exists.
+    go mod init ${gomod_init}
+fi
 go mod vendor -v
 popd > /dev/null

Not sure if this is the best way to pass the go module identifier into
the script, but running "go mod init" will conditionally create the
go.mod file if it doesn't already exist, just before running "go mod
vendor."

Best,
Christian
