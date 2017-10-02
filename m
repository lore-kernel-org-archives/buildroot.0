From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 02 Oct 2017 17:33:12 -0300
Subject: [Buildroot] [PATCH 1/2] support/run-tests: move packages tests
 to packages directories
References: <20171002053232.GA4753@scaer>
Message-ID: <59d2a288a9ed4_2c753fcd949aec68109dc@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Oct 02, 2017 at 02:32 AM, Yann E. MORIN wrote:

> On 2017-10-01 21:54 -0300, Ricardo Martincoski spake thusly:
>> On Sun, Sep 17, 2017 at 04:52 AM, Yann E. MORIN wrote:
>> > On 2017-09-17 09:18 +0200, Yann E. MORIN spake thusly:
>> >> On 2017-09-17 02:20 -0300, Ricardo Martincoski spake thusly:
>> >> > On Sat, Sep 16, 2017 at 05:38 PM, Yann E. MORIN wrote:
>> > [--SNIP--]
>> >> > > +        package = os.path.basename(dir)
>> >> > > +        for file in files:
>> >> > 
>> >> > You can import fnmatch to drastically reduce the number of regex compilations:
>> >> >         for file in fnmatch.filter(files, '*.py'):
>> >> Wee! :-)
>> > 
>> > In fact, no. At least, not in this state, because we do not want to
>> > match _any_ .py file; instead, we want to match only .py files that are
>> > named after the package.
>> 
>> We could use 2 filters. Instead of 8k+ regex compilations (one for each file
>> inside a package directory) we would run 2k+ fnmatch.filter (that probably
>> compile one regex, one per directory) and one regex compilation for each test
>> file in the package tree.
>> 
>>          for file in fnmatch.filter(files, '*.py'):
>>              if re.match("^{}.py$".format(package),file):
> 
> Err... I already changed it to:
> 
>     for file in fnmatch.filter(files, '{}.py'.format(package)):
> 
> Is there something wrong with that? ;-)

Nothing wrong. It's better this (your) way IMO.

> 
>> But well... the default python interpreter has a cache for regex (I don't know
>> its internals, just that it exists) and perhaps the change I suggested won't
>> make any difference in performance.
>> 
>> > 
>> > But I guess I can make it to work with fnmatch nonetheless. ;-)
>> 
>> BTW, could you change the DEVELOPERS file in the same patch?
>> +F:     package/*/*.py
>>  F:     support/testing/
> 
> You meant, add it to your entry ?

Yes.

> 
> In fact, I would expect to assign the test files to the corresponding
> package custodian (now imp[licit by their location).
> 
> But yes, I can assign them to you as well.

Thanks.

Regards,
Ricardo
