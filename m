From: Graham Newton <gnewton@peavey-eu.com>
Date: Wed, 06 Aug 2014 16:29:48 +0100
Subject: [Buildroot] support/download/wrapper expects file output in temp
 directory but support/wrapper/git produces output.gz
In-Reply-To: <CAAXf6LWBScdsOP=E0wC_CGE63R=dq5g21rqaUsWhtfijmU20Wg@mail.gmail.com>
References: <20131226222002.C88A59C1E4@busybox.osuosl.org>
 <CACmBeS0dY9NiAPJCTzSQGSH_zx71HN00MJ6Xk0_jD8DjyDwBRw@mail.gmail.com>
 <20140123181504.GB3446@free.fr>
 <CAAXf6LWBScdsOP=E0wC_CGE63R=dq5g21rqaUsWhtfijmU20Wg@mail.gmail.com>
Message-ID: <53E249EC.9040805@peavey-eu.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Running support/download/wrapper git fails because the final instruction 
of support/download/git gzips the output file creating output.gz which 
wrapper isn't expecting.

Example:

gnewton at ey-debx64-vm01 ~/Working/LinuxBuild $ support/download/wrapper 
git /home/gnewton/Working/LinuxBuild/dl/linux-ti816x_graham_dev.tar.gz 
gitolite at ey-ubsx64-svr02:LinuxKernel ti816x_graham_dev 
linux-ti816x_graham_dev
Doing shallow clone
Cloning into bare repository 'linux-ti816x_graham_dev'...
remote: Counting objects: 48600, done.
remote: Compressing objects: 100% (46466/46466), done.
Receiving objects: 100% (48600/48600), 143.16 MiB | 13.99 MiB/s, done.
remote: Total 48600 (delta 3863), reused 25085 (delta 1546)
Resolving deltas: 100% (3863/3863), done.
Checking connectivity... done.
cat: 
/home/gnewton/Working/LinuxBuild/output/build/.linux-ti816x_graham_dev.tar.gz.MX7pH9/output: 
No such file or directory

Build root pulled from git://git.busybox.net/buildroot master today 
(06/08/2014)

I assume the fix would be to either
i) in wrapper cat output.gz in the case of git
ii) copy output.gz to output after the gzip in support/download/git
