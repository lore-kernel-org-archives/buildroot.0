From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jan 2016 11:59:50 +0100
Subject: [Buildroot] [PATCH 1/2] scanpypi: new utility
In-Reply-To: <1438089330-18923-1-git-send-email-denis.thulin@openwide.fr>
References: <1438089330-18923-1-git-send-email-denis.thulin@openwide.fr>
Message-ID: <20160110105950.GA3460@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Denis, All,

Sorry for the long delay. I'm now having a look at this patch.

On 2015-07-28 15:15 +0200, Denis THULIN spake thusly:
> An utility for creating python package from the python package index
> It fetches packages info from http://pypi.python.org and generates
> corresponding packages files.

So, we currently have scancpan to create perl packages. You are adding
scanpypi to create Python packages. There's also someone who submitted
a script to generate a 'generic' package (i.e. not perl/python) [0].
The scancpan is written in perl, yours and the generic one in Python.

Besides Perl and Python, we also have nodejs which provides a similar
"package-store" and for which it would become interesting to provide a
helper script to generate packages [1].

What I would love to see is that we have a single script to add
packages. Something like:

    $ ./support/script/add-package -t TYPE [OPTS] PKG [PKG...]

with TYPE being one of the package types we currently have (generic,
autotools... python, perl...) or an abstract type (nodejs...).

Then, the cpan, pypi, nodejs... script would be just 'backends' that
would provide classes called by the main script, like;

    pkg = new PythonPkg("foo")
    pkg.get_br_name()       returns the BR2_PACKAGE_ name
    pkg.get_version()       returns the _VERSION string
    pkg.get_source()        returns the _SOURCE string
    pkg.get_site()          returns the _SITE string
    pkg.get_method()        returns the _SITE_METHOD string
    pkg.get_dependencies()  returns the _DEPENDENCIES list
    ... and so on, you get the idea. ;-)

That would also recursively generate the packages for the dependencies,
if not already present.

Of course, that would mean we'd have to standardise on a single
language. I think Python is the way to go here.

Would you be interested in pursuing this?

[0] https://patchwork.ozlabs.org/patch/523257/
[1] that could also require a nodejs-package infra, but not necessarily.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
