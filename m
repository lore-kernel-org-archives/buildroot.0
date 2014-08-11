From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 11 Aug 2014 14:21:50 +0200
Subject: [Buildroot] Multiple versions of packages
In-Reply-To: <CAMocaJC9XO6mXhuAs_F4r_ZR081--fXvh87iT4e3wW8eX7j1rg@mail.gmail.com>
References: <CAMocaJC9XO6mXhuAs_F4r_ZR081--fXvh87iT4e3wW8eX7j1rg@mail.gmail.com>
Message-ID: <53E8B55E.3080209@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jordi,

Jordi Llonch wrote:
> Hello,
>
> For a particular use case, I need to build different minor versions for
> the same package.
>
> The most notable example is mainly for interpreted languages: PHP,
> 5.5.x, 5.4.x, 5.3.x, ruby, etc. also for mysql or other packages where
> state can be incompatible across versions.
>
> I have implemented packages like "php53" and "php54" in a BR2_EXTERNAL.
> I am looking for better approaches on how to do this.
>
> Any thoughts or ideas?

Only one version of package is generally supported in Buildroot.
Supporting more versions involves a maintenance burden that is worth
only for a few packages.

For very critical packages (kernel, bootloaders, toolchain components),
there is a version selector in the package config options. See for
example Bootloaders -> Barebox version.
This is the most complete but also the most complex way of supporting
different versions. PHP and Ruby are surely not critical enough to be in
this list.

For some other packages (qt/qt5, python/python3) we have different
packages for the different versions, which is basically what you do
now.
This is less complex but may lead to some duplicated code and once again
it increases the amount of maintenance work, so it is generally not done
unless tha package is an important part of a system infrastructure.
I can't say whether PHP or Ruby might deserve this status. If you feel
they do and are willing to bring this in mainline Buildroot, feel free
to open the discussion with your motivations for considering the
package so important and why one version cannot meet all needs.

Another possibility is to select a different version for a specific
build. Just type

   make <PKG>_VERSION=1.2.3

to build with a specific version of <PKG>. This is a more limited
approach as it does not allow to easily handle the case  where
different versions of the package need different build instructions.

Yet another possibility is to maintain one branch for each combination
of package versions that you need to maintain. Of course this won't end
in mainline Buildroot, but it's OK to do on your local versioning system
if you want.

Hope this helps.

-- 
Luca
