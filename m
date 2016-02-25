From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 25 Feb 2016 14:19:56 +0100
Subject: [Buildroot] wget download: 'scheme missing' results in empty output
	file
Message-ID: <CAAXf6LXVweNYNvHNZG9bvYu9KVeAa9L6=qPOwRsmsx8DhVGTJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all,

When a package does not (by error) define FOO_SITE, and the source
archive is not already present, the wget download helper will be
invoked with as URL /foo-xxx.tar.gz. wget reports 'Scheme missing' and
bails out, but _returns with a successful error code (0)_.

As a result, the download helper happily continues with hash checking
and finally with the atomic mv of the temporary download file (which
has been created but is still empty) to the final output location.

Because as far as the download helper is concerned, everything went
successfully, also the build continues (but obviously fails further
on).

While I think wget should not return 0 on such a problem, I think we
should try and prevent such problems. One way is to expect the
downloaded file size to be greater than 0. If that requirement is not
met, the download helper should bail out.

A patch like the below fixes the problem:

diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -87,6 +87,12 @@ main() {
         exit 1
     fi

+    if ! [ -s "${output}" ]; then
+        error "empty download detected\n"
+        rm -rf "${tmpd}"
+        exit 1
+    fi
+
     # cd back to free the temp-dir, so we can remove it later
     cd "${OLDPWD}"



This clearly assumes that no package tries to download a file with size 0.

If you agree with such a change I can send a proper patch.

Thanks,
Thomas
