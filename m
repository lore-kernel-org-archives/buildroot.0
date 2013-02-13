From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Wed, 13 Feb 2013 22:43:13 +0100
Subject: [Buildroot] [PATCH v0] Add support for automated building of
 Opkg repository
In-Reply-To: <1358268430-2431-1-git-send-email-jezz@sysmic.org>
References: <1358268430-2431-1-git-send-email-jezz@sysmic.org>
Message-ID: <511C08F1.702@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello J?r?me,

Am 15.01.2013 17:47, schrieb J?r?me Pouiller:
> Dear,
> 
> I wrote a first draft of support of building deb or ipk file in Buildroot. The 
> result looks like this:
>   http://sysmic.org/~jezz/ipk_repository

This looks impressive and the OPKG packaging would be a really "killer"
feature in buildroot for me! OPKG packages is one of the features I'm
really missing.

> This patch use inotify to spy which file are installed by package. Once 
> installation is done, it copy file to a temporary directory where ipk file is 
> built.
> 
> During this copy, file are splited in 5 ipk files:
>         - main package with debug symbols stripped off
>         - debug symbols
>         - development files
>         - documentation files
>         - locales

This would be much more than I use currently in an other existing
project, sounds like you wanted to build the *one* big solution. ;)

> 
> All these files exist since it is done before target-finalize rule. 
> 
> Next script create "control" files needed for building. Script parse Config.in 
> file to extract help and place it as Description in ipk file.

Creating the control file in runtime would remove the necessary to
rework the current packages, if this works ... great!

> Finaly, dpkg-deb is used to create files. Files get deb extention but they are 
> compatible with opkg/ipkg. I don't know if it would be better to use opkg-build 
> script.

I would say this depends on the nature of the script, but this can be
tested.

> Result is not so bad, as you can see on URL above and it is not intrusive. I would
> be glad to get your opinion about this work. What do you think about it?
> 
> Current restrictions and things to do:
>   - Be able to correctly extract Help from complex Config.in
>   - Parse Depends field of Config.in
>   - Check dependencies using ldd

In the buildsystem-cs [1] (a system for building images for various DVB
setopboxes) a friend of mine use some scripts [2] to get the
dependencies and doing the creating of the packages incl. the comparing
if the package is really new. Maybe there is something useful to find.

>   - Add packages for skeleton copy, libc copy and target-finalize rule
>   - Detect file written by multiple packages
>   - Be able to package setuid binaries
>   - Kill inotify if make is interrupted
>   - Allow to customize Maintener name, Company name, etc...
>   - Allow to append a suffix to package versions
>   - Re-use strip commands defined in .config
>   - Add gnu-debuglink to binaries
>   - I need plenty of Makefile variables. It would be better if ipk-pre.sh and 
>     ipk-post.sh were converted to Makefiles?
>   - Make Architecture field a standard field recognized by Debian
>   - Check inotifywait is correctly started before continue installation
>   - Be able to do parallel installation
>   - Check host tools dependencies

What about a package with the basic rootfs after passing the overlay and
post-build.sh script? Do you have allready think about that?

[1] http://gitorious.org/neutrino-hd/buildsystem-cs
[2] https://gitorious.org/neutrino-hd/buildsystem-cs/trees/master/scripts

-- 
Mit freundlichen Gr??en
Carsten Sch?nert
