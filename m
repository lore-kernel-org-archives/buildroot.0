From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 May 2018 21:44:29 +0200
Subject: [Buildroot] [PATCH v3 5/7] support/dockerfile: install flake8
In-Reply-To: <5b0b70db274a6_4fb02aaaf272e0a857980@ultri5.mail>
References: <20180527164213.GD2965@scaer>
 <5b0b70db274a6_4fb02aaaf272e0a857980@ultri5.mail>
Message-ID: <20180528194429.GF2965@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2018-05-28 00:00 -0300, Ricardo Martincoski spake thusly:
> First of all: I don't think we need to hurry to fix it in the master branch.
> The release is so close. Unless of course we need to generate a new docker
> image right now for some reason.
> Do you disagree?

Absolutely no urgency at all. ;-)

[--SNIP--]
> > Do you think we could get away without running this command at all, and
> > just run the pip-install one, below, since we force the version of the
> > modules we isntall?
> 
> No. But certainly we can come up with some command that generates reproducible
> images.
> 
> By trying to install packages without that line we would get errors [1] and [2].
> The only version that we don't *need* to upgrade is pip. apt-get installs 9.0.1,
> and the pip --upgrade installed version 9.0.2 at the time the current image was
> generated.
> An image generated today would have pip 10.0.1, demonstrating the problem you
> found in the current Dockerfile.
> 
> Using 'pip freeze' and 'pip list' inside the current image we can dump all the
> current package versions [3].
> Since the list of packages to install will become longer we could even move it
> to a separate file, as suggested in [4] and also in the example (but not the
> text) from the 'Best practices' guide which url you shared a while ago [5].
> 
> So a way to generate an image equivalent to the current one would be:
> 
> @ support/docker/Dockerfile:
> # For check-flake8
> COPY requirements.txt /tmp/
> RUN pip install -q \
>         pip==9.0.2 \
>         setuptools==39.0.1 \
>         wheel==0.30.0 && \
>     pip install -q -r /tmp/requirements.txt
> 
> @ support/docker/requirements.txt
> bzr==2.8.0.dev1
> configobj==5.0.6
> configparser==3.5.0
> enum34==1.1.6
> flake8==3.5.0
> mccabe==0.6.1
> mercurial==4.0
> nose2==0.6.5
> pexpect==4.2.1
> ptyprocess==0.5.1
> pycodestyle==2.3.1
> pyflakes==1.6.0
> six==1.10.0
> 
> And maybe a comment at the first line of the new file would be nice:
> # output from 'pip freeze'
> 
> What do you think about this approach?

Why do we even use pip to install those? Can't we just rely on the
verions actually packaged in the distro instead? I.e.

    apt-get install python-configobj python-configparser etc...

Of course, provided that the module is indeed packaged in the distro...
As far as I can see, there should be everything we need, no?

The only two for which I have a doubt are bzr (python-bzrlib) and
mercurial (python-hglib); all the others are in stretch-20171210.

But if we apt-get install python-flake8, then it should bring all its
dependencies I guess:

    root at 39b33276de75:/# apt-get install python-flake8
    Reading package lists... Done
    Building dependency tree
    Reading state information... Done
    The following additional packages will be installed:
      dh-python javascript-common libjs-jquery libjs-sphinxdoc libjs-underscore libmpdec2 libpython3-stdlib
      libpython3.5-minimal libpython3.5-stdlib pyflakes pyflakes3 python-configparser python-enum34
      python-mccabe python-pycodestyle python-pyflakes python-setuptools python3 python3-minimal
      python3-pkg-resources python3-pyflakes python3.5 python3.5-minimal
    Suggested packages:
      apache2 | lighttpd | httpd python-enum34-doc python-mock python-setuptools-doc python3-doc python3-tk
      python3-venv python3-setuptools python3.5-venv python3.5-doc binfmt-support
    The following NEW packages will be installed:
      dh-python javascript-common libjs-jquery libjs-sphinxdoc libjs-underscore libmpdec2 libpython3-stdlib
      libpython3.5-minimal libpython3.5-stdlib pyflakes pyflakes3 python-configparser python-enum34
      python-flake8 python-mccabe python-pycodestyle python-pyflakes python-setuptools python3
      python3-minimal python3-pkg-resources python3-pyflakes python3.5 python3.5-minimal

Note that I don't care if stretch packages a different version than what
we curently have; I'd prefer that we use the distro-packaged versions,
since we know that apt-get *is* reproducible as we use a fixed version
of the distro.

> Are you preparing a patch?

When we agree on the directions, yes I can.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
