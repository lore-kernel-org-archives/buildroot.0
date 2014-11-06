From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 06 Nov 2014 16:19:15 +0100
Subject: [Buildroot] Creation of /etc/dropbear
Message-ID: <545B9173.9080502@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have a Buildroot-based project where the target rootfs is read-only,
and there is a writable partition mounted on /mnt/user.

When it is first started, dropbear creates keys in /etc/dropbear. In
order to make this possible, in my board rootfs additions I create
/etc/dropbear as a a symlink to /mnt/user/etc/dropbear, which is an
initially empty directory in the writable partition.

It all works just fine, except when I rebuild a project without doing
'make clean' and dropbear is built (this could happen because its
version was bumped, or because I do make dropbear-rebuild or whatever
else). Here the dropbear install step calls

         mkdir -p $(TARGET_DIR)/etc/dropbear

And fails, because $(TARGET_DIR)/etc/dropbear already exists but is not
a directory: it is a broken symlink.

I'd like to solve this issue in an upstream-friendly way, but I'm not
sure which way is the best. Nothing can be done in a post-build or
post-image script, because the issue is raised way before, when
building the dropbear package.

A simple option would be to remove the directory before creating it,
assuming there's no valuable info in there:

+       rm -fr $(TARGET_DIR)/etc/dropbear
         mkdir -p $(TARGET_DIR)/etc/dropbear

A safer way would be to check if it exists either as a directory or
as a symlink:

+       if [ ! -d $(TARGET_DIR)/etc/dropbear ] && \
+          [ ! -L $(TARGET_DIR)/etc/dropbear ] ; then
                 mkdir -p $(TARGET_DIR)/etc/dropbear
+       fi

Both would work, but what if the same problem happens in other places?
There would be the risk to sprinkling similar ifs here and there in the
Buildroot codebase.

Moreover neither of these solutions looks very clean.

Any better ideas?

Thanks,
-- 
Luca
