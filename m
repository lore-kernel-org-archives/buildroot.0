From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 15:16:16 +0100
Subject: [Buildroot] [PATCH v3 3/9] lttng-tools: bump to version 2.8.2
In-Reply-To: <20161031074624.7576-4-eeppeliteloop@gmail.com>
References: <20161031074624.7576-1-eeppeliteloop@gmail.com>
 <20161031074624.7576-4-eeppeliteloop@gmail.com>
Message-ID: <20161101151616.566ecb48@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 31 Oct 2016 03:46:18 -0400, Philippe Proulx wrote:
> The current patches are dropped because they were merged upstream.
> 
> The new patches exist to fix the build with musl. They were submitted on
> the lttng-dev mailing list, but not merged yet, or not merged in 2.8.2.
> 
> LTTng-tools now has its man pages written in AsciiDoc and they get
> converted to troff at build time. This is not needed in a Buildroot
> image anyway.
> 
> The --enable-lttng-ust/--disable-lttng-ust configure options are renamed
> to --with-lttng-ust/--without-lttng-ust in v2.8.
> 
> Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>

I'm sorry, but this patch does not apply:

thomas at skate:~/projets/buildroot (master)$ curl https://patchwork.ozlabs.org/patch/689224/mbox/ | git am  -3 -s
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 24585    0 24585    0     0   9319      0 --:--:--  0:00:02 --:--:--  9319
Applying: lttng-tools: bump to version 2.8.2
Using index info to reconstruct a base tree...
.git/rebase-apply/patch:117: space before tab in indent.
 	errno = 0;
.git/rebase-apply/patch:118: space before tab in indent.
 	id = strtol(argv[1], &name, 10);
.git/rebase-apply/patch:121: space before tab in indent.
 		ret = del_output(UINT32_MAX, name);
.git/rebase-apply/patch:122: space before tab in indent.
 	} else if (errno == 0 && *name == '\0') {
.git/rebase-apply/patch:123: space before tab in indent.
 		ret = del_output(id, NULL);
error: patch failed: package/lttng-tools/0001-Fix-build-failure-when-__GLIBC_PREREQ-is-missing.patch:1
error: package/lttng-tools/0001-Fix-build-failure-when-__GLIBC_PREREQ-is-missing.patch: patch does not apply
error: patch failed: package/lttng-tools/0002-Fix-add-missing-sys-types.h-header.patch:1
error: package/lttng-tools/0002-Fix-add-missing-sys-types.h-header.patch: patch does not apply
error: Did you hand edit your patch?
It does not apply to blobs recorded in its index.
Patch failed at 0001 lttng-tools: bump to version 2.8.2
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

So I fixed up the things myself, by removing the existing patches in
package/lttng-tools/, and then applying your patches without the hunks
removing the old patches. It then applied cleanly, but makes the build
of lttng-tools build fail because the new patches don't apply at all:

>>> lttng-tools 2.8.2 Extracting
bzcat /home/thomas/dl/lttng-tools-2.8.2.tar.bz2 | tar --strip-components=1 -C /home/thomas/projets/buildroot/output/build/lttng-tools-2.8.2   -xf -
>>> lttng-tools 2.8.2 Patching

Applying 0001-Fix-snapshot-del-output-with-name-on-musl.patch using patch: 
patching file src/bin/lttng/commands/snapshot.c
Hunk #1 FAILED at 350.
1 out of 1 hunk FAILED -- saving rejects to file src/bin/lttng/commands/snapshot.c.rej
package/pkg-generic.mk:180: recipe for target '/home/thomas/projets/buildroot/output/build/lttng-tools-2.8.2/.stamp_patched' failed

And indeed the code and your patch clearly don't match. Your patch does:

 	errno = 0;
 	id = strtol(argv[1], &name, 10);
-	if (id == 0 && errno == 0) {
+	if (id == 0 && (errno == 0 || errno == EINVAL)) {
 		ret = del_output(UINT32_MAX, name);
 	} else if (errno == 0 && *name == '\0') {
 		ret = del_output(id, NULL);

And the code looks like this:

	errno = 0;
	id = strtol(argv[1], &name, 10);
	if (id == 0 && errno == 0) {
		if (lttng_opt_mi) {
			ret = mi_del_output(UINT32_MAX, name);
		} else {
			ret = del_output(UINT32_MAX, name);
		}
	} else if (errno == 0 && *name == '\0') {
		if (lttng_opt_mi) {
			ret = mi_del_output(id, NULL);
		} else {
			ret = del_output(id, NULL);
		}

See the if (lttng_opt_mi), which is not in the context of your patch?

So either I'm missing something, or you have not even build-tested the
patches you are sending.

Could you rework this and send an updated version?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
