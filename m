From: Eelco Chaudron <echaudron@xiot.nl>
Date: Tue, 2 Feb 2016 20:54:26 +0100
Subject: [Buildroot] [PATCH 1/2] scanpypi: new utility
In-Reply-To: <AAEB3B19-DD00-496E-BE0A-D227A5198E0D@xiot.nl>
References: <1438089330-18923-1-git-send-email-denis.thulin@openwide.fr>
 <20160110105950.GA3460@free.fr>
 <AAEB3B19-DD00-496E-BE0A-D227A5198E0D@xiot.nl>
Message-ID: <0AC4E613-2042-4057-8487-BAD82B2C020B@xiot.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guess it might be my version of python, however changing the zip part to the following fixed it;

        if self.filename[-3:] == 'zip':                                                                                            
            with zipfile.ZipFile(as_file) as as_zipfile:                                                                           
                tmp_pkg = os.path.join(tmp_path, self.buildroot_name) 

python
Python 2.7.10 (default, Oct 14 2015, 16:09:02) 
[GCC 5.2.1 20151010] on linux2

//Eelco

> On 02 Feb 2016, at 19:02, Eelco Chaudron <echaudron@xiot.nl> wrote:
> 
> I was trying your script and I seem to run into an issue with zip?ed archives;
> 
> $ ~/scanpypi WTForms -o package
> buildroot package name for WTForms: python-wtforms
> Package: python-wtforms
> Fetching package WTForms
> Downloading package WTForms from https://pypi.python.org/packages/source/W/WTForms/WTForms-2.1.zip <https://pypi.python.org/packages/source/W/WTForms/WTForms-2.1.zip>...
> Traceback (most recent call last):
>   File "/home/echaudron/scanpypi", line 653, in <module>
>     main()
>   File "/home/echaudron/scanpypi", line 596, in main
>     package.extract_package(tmp_path)
>   File "/home/echaudron/scanpypi", line 211, in extract_package
>     with zipfile.open(fileobj=as_file) as as_zipfile:
> AttributeError: 'module' object has no attribute ?open'
> 
> //Eelco
> 
>> On 10 Jan 2016, at 11:59, Yann E. MORIN <yann.morin.1998 at free.fr <mailto:yann.morin.1998@free.fr>> wrote:
>> 
>> Denis, All,
>> 
>> Sorry for the long delay. I'm now having a look at this patch.
>> 
>> On 2015-07-28 15:15 +0200, Denis THULIN spake thusly:
>>> An utility for creating python package from the python package index
>>> It fetches packages info from http://pypi.python.org <http://pypi.python.org/> and generates
>>> corresponding packages files.
>> 
>> So, we currently have scancpan to create perl packages. You are adding
>> scanpypi to create Python packages. There's also someone who submitted
>> a script to generate a 'generic' package (i.e. not perl/python) [0].
>> The scancpan is written in perl, yours and the generic one in Python.
>> 
>> Besides Perl and Python, we also have nodejs which provides a similar
>> "package-store" and for which it would become interesting to provide a
>> helper script to generate packages [1].
>> 
>> What I would love to see is that we have a single script to add
>> packages. Something like:
>> 
>>    $ ./support/script/add-package -t TYPE [OPTS] PKG [PKG...]
>> 
>> with TYPE being one of the package types we currently have (generic,
>> autotools... python, perl...) or an abstract type (nodejs...).
>> 
>> Then, the cpan, pypi, nodejs... script would be just 'backends' that
>> would provide classes called by the main script, like;
>> 
>>    pkg = new PythonPkg("foo")
>>    pkg.get_br_name()       returns the BR2_PACKAGE_ name
>>    pkg.get_version()       returns the _VERSION string
>>    pkg.get_source()        returns the _SOURCE string
>>    pkg.get_site()          returns the _SITE string
>>    pkg.get_method()        returns the _SITE_METHOD string
>>    pkg.get_dependencies()  returns the _DEPENDENCIES list
>>    ... and so on, you get the idea. ;-)
>> 
>> That would also recursively generate the packages for the dependencies,
>> if not already present.
>> 
>> Of course, that would mean we'd have to standardise on a single
>> language. I think Python is the way to go here.
>> 
>> Would you be interested in pursuing this?
>> 
>> [0] https://patchwork.ozlabs.org/patch/523257/ <https://patchwork.ozlabs.org/patch/523257/>
>> [1] that could also require a nodejs-package infra, but not necessarily.
>> 
>> Regards,
>> Yann E. MORIN.
>> 
>> -- 
>> .-----------------.--------------------.------------------.--------------------.
>> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
>> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
>> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
>> | http://ymorin.is-a-geek.org/ <http://ymorin.is-a-geek.org/> | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
>> '------------------------------^-------^------------------^--------------------'
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net <mailto:buildroot@busybox.net>
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160202/1e833d9f/attachment.html>
