From: swirsky at gmail.com <swirsky@gmail.com>
Date: Tue, 13 Apr 2021 19:24:16 -0700
Subject: [Buildroot] Missing .pyc files in target filesystem
In-Reply-To: <de925ef6-7c7f-94ef-2c6f-57d40dcec656@mind.be>
References: <003801d72fcf$28780910$79681b30$@gmail.com>
 <c7681c66-e513-380e-cba3-8b9b2f6b98fa@mind.be>
 <007101d72fd5$a67676c0$f3636440$@gmail.com>
 <de925ef6-7c7f-94ef-2c6f-57d40dcec656@mind.be>
Message-ID: <00a401d730d5$455c8ea0$d015abe0$@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I never did figure out the why, but I "binary searched" the past dozen or so commits and found the one that broke the .pyc files. It was when I added a certain external out-of-tree package to our project. 

What's interesting is 
  - this package was not specified in the standard  config file (ie., the files under configs that the menu manages). It was listed in the Config.in where all the external packages are enumerated. I was under the impression that packages not in a ~/project/configs configuration had no effect on the build
  - the package in question was "remote_pdb"

I thought that, maybe, someone put some code to see if you've turned on any form of pdb and suppresses .pyc generation but I saw no such thing when reading the source code. So my best guess is that I had a faulty makefile for this external project that was causing the rest of the python machinery to fail (perhaps none of the other "hooks" ran) and it failed without letting me know.

Thanks for all your help, Arnout!
