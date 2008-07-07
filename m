From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 07 Jul 2008 15:44:10 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <20080707132821.GE15840@mx.loc>
References: <20080704222950.E76B63C61F@busybox.net>	<87fxqmg53j.fsf@macbook.be.48ers.dk>	<48720878.3070602@atmel.com>
	<20080707123642.GA15840@mx.loc>	<487212CC.7020303@atmel.com>
	<20080707131123.GC15840@mx.loc> <20080707132821.GE15840@mx.loc>
Message-ID: <48721DAA.3080900@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Bernhard Fischer skrev:
> On Mon, Jul 07, 2008 at 03:11:23PM +0200, Bernhard Fischer wrote:
>> On Mon, Jul 07, 2008 at 02:57:48PM +0200, Ulf Samuelsson wrote:
>>> -----BEGIN PGP SIGNED MESSAGE-----
>>> Hash: SHA1
>>>
>>> Bernhard Fischer skrev:
>>>> On Mon, Jul 07, 2008 at 02:13:44PM +0200, Ulf Samuelsson wrote:
>>>>> -----BEGIN PGP SIGNED MESSAGE-----
>>>>> Hash: SHA1
>>>>>
>>>>> Peter Korsgaard skrev:
>>>>>> That breaks the source-check/external-deps check in
>>>>>> Makefile.autotools.in (r22607).
>>>>>>
>>>>> Is not something like the following to be preferred?
>>> Previously the special make targets to check availability
>>> of packages on internet would download each target
>>> even if the target existed in $(DL_DIR) creating
>>> <package>.tar.bz2.<n>, or it would not check
>>> the package at all.
>>>
>>> Peter introduced a fix where he will treat the download
>>> differently if the MAKELEVEL=0 (normal) or if the
>>> MAKELEVEL=1 which is the case for make source-check
>>> and make external-deps.
>>>
>>> When I introduced easy logging by "make log",
>>> this breaks the autotools, since this also runs
>>> at MAKELEVEL=1.
>>>
>>> I do not think that MAKELEVEL is a good variable
>>> to detect if someone wants to do source-check
>>> or external-deps.
>> make source-check is _supposed_ to download all sources, regardless of
> 
> Where download is not really appropriate since we do this (for speed and
> volume reasons) deliberately with wget's --spider option, just as a
> sidenote.
> 
>> whether or not the package exists locally. Keep in mind that it is ment
>> to check if packages and patches are (still) downloadable or not and
>> explicitely disregarding any local stuff to simulate what users will
>> experience.
>>
>> Perhaps the source-check target should consequently use a
>> $(DL_DIR).check dir then. This would avoid breakage elsewhere.
> 
> Due to spider, please disregard this comment about $(DL_DIR).check.

I think the issue is that "source-check" and "external-deps" needs
special treatment in autotools so that the
WGET commands is executed regardless if the target package
is present in DL_DIR or not.

The WGET commands has been redefined to do WGET --spider
or to run a script and neither of these will actually
download the tarballs.

What I question is the use of the MAKELEVEL
variable to determine if this special treatment
should be activated or not.


>> Apart from that such a "log" target strikes me as unwarranted.
>> Just
>> $ (make) 2>&1 >& MY.log
>> or
>> $ nohup make &
>>
>> would a more sensible thing to do, IMHO.
>>

Not if you want your log file to have the
same name as your project.

Try typing
"make > atngw100-expanded-3.log 2>&1"
a couple of times, and you see what I mean.

"make log" is so much easier, and you can
use bash to just do "make log" by just pressing up-arrow <CR/LF>.


>> HTH,
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIch2pAyRRH5cXxqwRArO1AKCyrz725gm471S/jZo+EABTwkZs9QCgmVMk
IPBfdLBSIpA5EF57rOf1fBo=
=NDo1
-----END PGP SIGNATURE-----
