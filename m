From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 9 Apr 2021 15:00:01 +0200
Subject: [Buildroot] Setting permissions of symlinks deployed by a
 buildroot package
In-Reply-To: <AM6PR05MB5928C0C508BD9C69B8677D13A3749@AM6PR05MB5928.eurprd05.prod.outlook.com>
References: <AM6PR05MB5928C0C508BD9C69B8677D13A3749@AM6PR05MB5928.eurprd05.prod.outlook.com>
Message-ID: <622c1ec8-13d6-31c5-6114-625f2de3c0ab@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/04/2021 12:00, Ivan Castell wrote:
> 
> Hello forum.
> 
> I am just trying to customize permissions for a set of files deployed after
> installing a buildroot package. Found the FOO_PERMISSIONS feature, that seems to
> be the proper way to go:
> 
> define FOO_PERMISSIONS
> /usr/share/foo/ r ?775 root wheel - ?- ?- ?- ?-
> endef
> ...
> ifeq ($(BR2_PACKAGE_FOO),y)
> $(eval $(generic-package))
> endif
> 
> The problem happens in FOO_PERMISSIONS when iterating recursively with "r" over
> /usr/share/foo/. Inside that directory there are some sub-directories with some
> regular files. But also some symlinks pointing to files inside the embedded
> target platform that doesn't exist in the build platform. For instance:
> 
> /usr/share/foo/resources/foo.json -> /usr/share/foo/foo.json
> 
> It seems makedevs doesn't manage symlinks properly:
> 
> makedevs: chown failed for
> /BUILDROOT/output/target/usr/share/foo/resources/foo.json: No such file or directory

 Yeah, that's expected. Symlinks are annoying.

 I usually avoid this kind of issue by making sure that all symlinks are
relative. Si instead of /usr/share/foo/foo.json, point to ../foo.json. Modern ln
even has the -r option to do this automatically.


 A more fundamental solution would be to give makedevs a big makeover and
explicitly handle symlinks in all syscalls, and make them relative to the target
directory.

 All that is extremely silly of course, because we're not *actually* doing any
chown, we're just trying to update the fakeroot database... So some integration
of makedevs with fakeroot would be an even better solution. But that's a long
way off.


 Regards,
 Arnout

> 
> The file exists:
> 
> $ ls -l /BUILDROOT/output/target/usr/share/foo/resources/foo.json ->
> /usr/share/foo/foo.json
> 
> But problem is, it's a symlink pointing to a file that is missing on the build
> platform:
> 
> $ ls -l /usr/share/foo/foo.json
> ls: cannot access '/usr/share/foo/foo.json': No such file or directory
> 
> This error can be fixed in different ways. The first approach is touching a
> dummy file inside the build platform:
> 
> $ touch /usr/share/foo/foo.json
> 
> But this is a nasty fix.
> 
> A second approach would be setting permissions for every single file and symlink
> deployed, managing regular files with "f" and symlinks with "l" type.
> 
> define FOO_PERMISSIONS
> /usr/share/foo/path/to/regular/file f ?775 root wheel - ?- ?- ?- ?-
> /usr/share/foo/path/to/symlink l 775 root wheel - ?- ?- ?- ?-
> ....
> endef
> 
> But this is not a reasonable fix for packages deploying hundred of files. In
> this case, you loose the nice recursive feature.
> 
> A third approach would be to create all symlinks inside a startup script.?But
> again, that not seems to be the most convenient way to fix this issue.
> 
> What should be the most convenient way to proceed in this case?
> 
> Thanks!
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
