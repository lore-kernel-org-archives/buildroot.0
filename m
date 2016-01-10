From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 10 Jan 2016 16:36:50 +0100
Subject: [Buildroot] [PATCH 1/2] scanpypi: new utility
In-Reply-To: <20160110105950.GA3460@free.fr>
References: <1438089330-18923-1-git-send-email-denis.thulin@openwide.fr>
 <20160110105950.GA3460@free.fr>
Message-ID: <56927A92.50804@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10-01-16 11:59, Yann E. MORIN wrote:
> Denis, All,
> 
> Sorry for the long delay. I'm now having a look at this patch.
> 
> On 2015-07-28 15:15 +0200, Denis THULIN spake thusly:
>> An utility for creating python package from the python package index
>> It fetches packages info from http://pypi.python.org and generates
>> corresponding packages files.
> 
> So, we currently have scancpan to create perl packages. You are adding
> scanpypi to create Python packages. There's also someone who submitted
> a script to generate a 'generic' package (i.e. not perl/python) [0].
> The scancpan is written in perl, yours and the generic one in Python.
> 
> Besides Perl and Python, we also have nodejs which provides a similar
> "package-store" and for which it would become interesting to provide a
> helper script to generate packages [1].
> 
> What I would love to see is that we have a single script to add
> packages. Something like:
> 
>     $ ./support/script/add-package -t TYPE [OPTS] PKG [PKG...]
> 
> with TYPE being one of the package types we currently have (generic,
> autotools... python, perl...) or an abstract type (nodejs...).
> 
> Then, the cpan, pypi, nodejs... script would be just 'backends' that
> would provide classes called by the main script, like;
> 
>     pkg = new PythonPkg("foo")
>     pkg.get_br_name()       returns the BR2_PACKAGE_ name
>     pkg.get_version()       returns the _VERSION string
>     pkg.get_source()        returns the _SOURCE string
>     pkg.get_site()          returns the _SITE string
>     pkg.get_method()        returns the _SITE_METHOD string
>     pkg.get_dependencies()  returns the _DEPENDENCIES list
>     ... and so on, you get the idea. ;-)

 However, it is more natural for a CPAN-accessor to be written in perl. So I
guess the backend scripts should be really independent scripts that report the
package metadata in a specified format. Hm, you know what, let's use Config.in
and pkg.mk as the specification!

 In short, I'm not so convinced that having everything written in the same
language is such an advantage.

 But of course, if someone shows me the patches, I could change my mind.


 Regards,
 Arnout


> That would also recursively generate the packages for the dependencies,
> if not already present.
> 
> Of course, that would mean we'd have to standardise on a single
> language. I think Python is the way to go here.
> 
> Would you be interested in pursuing this?
> 
> [0] https://patchwork.ozlabs.org/patch/523257/
> [1] that could also require a nodejs-package infra, but not necessarily.
> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
