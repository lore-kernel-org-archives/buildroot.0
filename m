From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 09 Jul 2014 09:33:07 +0200
Subject: [Buildroot] Is it possible to override a package from git?
In-Reply-To: <CAFRxoJ=iMsDdd3x5bGxkoyQ=rmeEMUKVaaBEOA16Kt8FBWc89w@mail.gmail.com>
References: <CAFRxoJ=iMsDdd3x5bGxkoyQ=rmeEMUKVaaBEOA16Kt8FBWc89w@mail.gmail.com>
Message-ID: <53BCF033.8050006@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marco,

Marco Pastorelli wrote:
> Hi everybody,
>
> I fetch my personal packages from my git repo specifying the tag.
> Now I would like to set up a nightly build system, so I need to download
> the HEAD of my packages repo instead of a specific tag.
>
> Is there a way to override the tag?

You can, although this requires some manual tweaking because it is not
typical.

It is not typical because Buildroot is generally meant to perform
reproducible builds. So it is usual to fetch a tag or SHA-1 from git
repos.

However in a nightly build system it can make sense.

To do that, you should set <MYPKG>_VERSION to a branch name. For
example <MYPKG>_VERSION=master.

You can do it also on the command line, without touching your source
code:
   make my_defconfig
   make <MYPKG>_VERSION=master

This will fetch the top of the master branch, not a specific tag.

However, when you build the next time, Buildroot will already find
<mypkg>-master.tar.gz in the downloaded sourced directory and will not
download it again. So before building you have to remove that archive
(or the whole download directory).

You'll also need to remove the output/build/<mypkg>-master/ directory,
or Buildroot will think it already has the sources for the "master"
version extracted and won't extract them again.

In a nutshell, if you're building in-tree:
   rm -f <my_download_dir>/<mypkg>-master.tar.gz            [*]
   make my_defconfig
   make <MYPKG>_VERSION=master <mypkg>-dirclean all

-- 
Luca
