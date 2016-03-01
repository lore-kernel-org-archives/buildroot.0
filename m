From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 29 Feb 2016 22:44:02 -0300
Subject: [Buildroot] [PATCH 1/2] scanpypi: new utility
In-Reply-To: <1438089330-18923-1-git-send-email-denis.thulin@openwide.fr>
References: <1438089330-18923-1-git-send-email-denis.thulin@openwide.fr>
Message-ID: <1456796642-17793-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> An utility for creating python package from the python package index
> It fetches packages info from http://pypi.python.org and generates
> corresponding packages files.
> 
> Signed-off-by: Denis THULIN <denis.thulin@openwide.fr>

Tested-by: Carlos Santos <casantos@datacom.ind.br>

When I ran the script on my machine I got an error from Python because
it requires python-setuptools, which I did not have installed.

$ uname -a Linux p7-1130br 4.2.0-30-generic #36-Ubuntu SMP Fri Feb 26 00:58:07 UTC 2016 x86_64 x86_64 x86_64 GNU/Linux
$ support/scripts/scanpypi delayqueue
Traceback (most recent call last):
  File "support/scripts/scanpypi", line 48, in <module>
    import setuptools
ImportError: No module named setuptools

I don't think it's a big deal for a support script but it would be nice
to document the requirements in the initial comment block.

Going forward...

$ sudo apt-get install python-setuptools
[...]

Choose a random python pachage from PyPI and created the Buidroot package.

$ support/scripts/scanpypi delayqueue
buildroot package name for delayqueue: python-delayqueue
Package: python-delayqueue
Fetching package delayqueue
Downloading package delayqueue from https://pypi.python.org/packages/source/d/delayqueue/delayqueue-0.0.3.tar.gz...
Checking if package ./package/python-delayqueue already exists...
Creating ./package/python-delayqueue/python-delayqueue.mk...
WARNING: No license file found, please specify it manually afterwards
Creating ./package/python-delayqueue/python-delayqueue.hash...
Creating ./package/python-delayqueue/Config.in...
[...]

Edit package/Config.in and add to the "External python modules" menu
a line containing

        source "package/python-delayqueue/Config.in"                                                                                                  
[...]

$ make menuconfig
[ Select the python-delayqueue package ]
$ make python-delayqueue
[...]
Success!

Verdict: your script seems to be a useful tool to create Python packages
for Buildroot. Of course the package that it creates must be tested before
submitting it upstream but that's another story.
