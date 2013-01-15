From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 15 Jan 2013 17:47:07 +0100
Subject: [Buildroot] [PATCH v0] Add support for automated building of Opkg
	repository
Message-ID: <1358268430-2431-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear,

I wrote a first draft of support of building deb or ipk file in Buildroot. The 
result looks like this:
  http://sysmic.org/~jezz/ipk_repository

This patch use inotify to spy which file are installed by package. Once 
installation is done, it copy file to a temporary directory where ipk file is 
built.

During this copy, file are splited in 5 ipk files:
        - main package with debug symbols stripped off
        - debug symbols
        - development files
        - documentation files
        - locales

All these files exist since it is done before target-finalize rule. 

Next script create "control" files needed for building. Script parse Config.in 
file to extract help and place it as Description in ipk file.

Finaly, dpkg-deb is used to create files. Files get deb extention but they are 
compatible with opkg/ipkg. I don't know if it would be better to use opkg-build 
script.

Result is not so bad, as you can see on URL above and it is not intrusive. I would
be glad to get your opinion about this work. What do you think about it?

Current restrictions and things to do:
  - Be able to correctly extract Help from complex Config.in
  - Parse Depends field of Config.in
  - Check dependencies using ldd
  - Add packages for skeleton copy, libc copy and target-finalize rule
  - Detect file written by multiple packages
  - Be able to package setuid binaries
  - Kill inotify if make is interrupted
  - Allow to customize Maintener name, Company name, etc...
  - Allow to append a suffix to package versions
  - Re-use strip commands defined in .config
  - Add gnu-debuglink to binaries
  - I need plenty of Makefile variables. It would be better if ipk-pre.sh and 
    ipk-post.sh were converted to Makefiles?
  - Make Architecture field a standard field recognized by Debian
  - Check inotifywait is correctly started before continue installation
  - Be able to do parallel installation
  - Check host tools dependencies
  
