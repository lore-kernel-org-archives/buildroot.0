From: Ivan Castell <icastell@circontrol.com>
Date: Thu, 8 Apr 2021 10:00:19 +0000
Subject: [Buildroot] Setting permissions of symlinks deployed by a buildroot
 package
Message-ID: <AM6PR05MB5928C0C508BD9C69B8677D13A3749@AM6PR05MB5928.eurprd05.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello forum.

I am just trying to customize permissions for a set of files deployed after installing a buildroot package. Found the FOO_PERMISSIONS feature, that seems to be the proper way to go:

define FOO_PERMISSIONS
/usr/share/foo/ r  775 root wheel -  -  -  -  -
endef
...
ifeq ($(BR2_PACKAGE_FOO),y)
$(eval $(generic-package))
endif

The problem happens in FOO_PERMISSIONS when iterating recursively with "r" over /usr/share/foo/. Inside that directory there are some sub-directories with some regular files. But also some symlinks pointing to files inside the embedded target platform that doesn't exist in the build platform. For instance:

/usr/share/foo/resources/foo.json -> /usr/share/foo/foo.json

It seems makedevs doesn't manage symlinks properly:

makedevs: chown failed for /BUILDROOT/output/target/usr/share/foo/resources/foo.json: No such file or directory

The file exists:

$ ls -l /BUILDROOT/output/target/usr/share/foo/resources/foo.json -> /usr/share/foo/foo.json

But problem is, it's a symlink pointing to a file that is missing on the build platform:

$ ls -l /usr/share/foo/foo.json
ls: cannot access '/usr/share/foo/foo.json': No such file or directory

This error can be fixed in different ways. The first approach is touching a dummy file inside the build platform:

$ touch /usr/share/foo/foo.json

But this is a nasty fix.

A second approach would be setting permissions for every single file and symlink deployed, managing regular files with "f" and symlinks with "l" type.

define FOO_PERMISSIONS
/usr/share/foo/path/to/regular/file f  775 root wheel -  -  -  -  -
/usr/share/foo/path/to/symlink l 775 root wheel -  -  -  -  -
....
endef

But this is not a reasonable fix for packages deploying hundred of files. In this case, you loose the nice recursive feature.

A third approach would be to create all symlinks inside a startup script. But again, that not seems to be the most convenient way to fix this issue.

What should be the most convenient way to proceed in this case?

Thanks!

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210408/6e0630bb/attachment.html>
