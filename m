Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9285CC19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 12:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18A1860E55;
	Tue,  9 Aug 2022 12:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18A1860E55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m8IyAXgJ0h2N; Tue,  9 Aug 2022 12:55:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC7F660E3A;
	Tue,  9 Aug 2022 12:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC7F660E3A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E6EAF1BF38A
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 12:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9CCB60E27
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 12:55:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9CCB60E27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EHY1uPW9DhBJ for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 12:55:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2713960E55
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on0114.outbound.protection.office365.us [23.103.209.114])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2713960E55
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 12:55:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=JE/22U6/ltXR0hXY2xhaawDUbYVK1xGAIcCUBkVJOCdfGFb/An1R/tVjqi3oBRRbyfC17OuWswCtCXkv/I+a7VWFTuMMxUp3ZL67n9X1BHiRjZQnZ0N/TK2asgtGTvyDwSb4gJlZNUaBOjxQqUoS+Jw59KSKyZQ+K4kIgBGwT/oyJDDgglBC2gkeBDenzq7JUE6YtNjCuxf/2qfOosNdohHy5FNGEFZCYZNcsW9tOqLA7Rr+T/MFyiO1IhNvZGUfC/gfD/OEtMdPPSodeJnp6X8tWMSz80M6vOdHFD9Fz0pQIBwQsM/FF+kAXoOxU3ztHMKXadcVNImS93+WdUVzYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sW1gEsr2l+t2hsxhV6FMrK7J8mMO42gUB2hZrC94bRg=;
 b=zJWSHl1Cj37Gwu63q5b3yiHoDkSFSR+exirreuxA21AtaxP/Gi+vEryxrHjEVNazrhN83mizjrLeH1cSbaa44Ud6iZamwSz1z6wM1UUE4SjdUtoukYksc8qLktq4OXSIoDHVsAsNdoPp/m64iDKRX3QvouF63VgiFPxnAc4COc5ezyE4/7rJR/nYCIp6ro65Hc1JuuHByknJ9eeTU4x2zzmJmGn0G0+YmuvptuCXRfWqfLryGsvo+/RLb9LUXD5+KjLvGjqnNTbGvmEB003rwfFoYp85LalBS/pXAl3nsisgJnrERl6Q8dxYI9Sxase/G37ivXkArqOpc4LfozNzVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1602.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:188::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Tue, 9 Aug
 2022 12:54:56 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::a01c:a0e2:2eaa:977]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::a01c:a0e2:2eaa:977%5]) with mapi id 15.20.5504.021; Tue, 9 Aug 2022
 12:54:56 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Federico Pellegrin <fede@evolware.org>, Arnout Vandecappelle
 <arnout@mind.be>
Thread-Topic: [External] - Re: [Buildroot] Python pyc only and problem with
 scripts
Thread-Index: AQHYqxCFmmdpszOXDU2CxzDByWtuhq2k/NmAgAB9dACAAIZ3AIAAgFeQ
Date: Tue, 9 Aug 2022 12:54:56 +0000
Message-ID: <PH1P110MB1603D8E2804E4F31B878B6039F629@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <CAM6O0Zgc_jfn+m1ZhRByLQ4QDDAYpAOQv-9aDRgruSYKWV5wUA@mail.gmail.com>
 <20220808122020.0c1ec66a@windsurf>
 <CAM6O0ZjLizEsUWZr106T6+WowWdkqE7k_a1bCaPeAVbPScZ6Ag@mail.gmail.com>
 <ea0d3b02-e5e1-9f4d-0d3a-a498f5d184f0@mind.be>
 <CAM6O0ZicaNFBn--yCoWOUkZZ3wBLKY24SDjTjsGz2y0Mbjy_1w@mail.gmail.com>
In-Reply-To: <CAM6O0ZicaNFBn--yCoWOUkZZ3wBLKY24SDjTjsGz2y0Mbjy_1w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d2b7393-28c2-4d4b-e2cf-08da7a065c24
x-ms-traffictypediagnostic: PH1P110MB1602:EE_
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6SaKGLLUxEDkvVYTYhCJzUuE1MbdMSphmeYzkQSM6HMa+pewsq+j0y1wlw0/f567Hqrw/zRTiJf73Yk7PlWx66/W8zgEe3KQR6ridJpenCg+1f0eWpFheg87D3YKPr/eY4ojKzXn02zIPGyGV8yO7FZUupTzB51OijN9sc4/PXIM1kfr/96BHvsDyYkaSjG8o+71L60HO9Fne9I8ZG43Pq6ksizr4S9/8CpXIK7TQ6CMTxGkqCclSHcxtva5iS/B8bfWiqjIzMI1EIq1+jLUBPIqwvU59TNyDumUxhkBtvvjjhgdlanfYDH9McMzQebjJ/SIjaXpvLBytiRQit+qL5r1vC65XfpZIXmh6AKLJpC89Q4TkAEJJrZ4DhLA46kOAos9aM7VGLzy1ogWXvvMP3ZeL/SwzqPj97lxq8Oop9/n/Vk6dJLcJ1FfXmTHAeuJ6rW9O0iGOZGc8uJFRIQOOHW8mNKMpmHkFbwSvJe53Aksz1Ggb2I44jw2r0woT1jrOpK2BTAuI8o4H4/tzhAT0jwbDug8q3S0jnqWbN+tAa1tS9F1/6FsbW6zpqgA0jhyEgKWG0riltLOqiXjvcTbIdLKynwCTSZX5LlYsEVKvrHTwgyON8HTHFCRZHTOtPezRLn89RoxNfeBA3+o1Hg8gee052Ri6ZwJphIUdqRz4QPIcaKYzPi6i8xKsTJN42SG7rVwvyJ1c1Uzq8zfRis9gKkvMUinvPIADarm8FMe1ECNXYF1ygX8vDbVZQMg5mE9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39830400003)(396003)(136003)(366004)(53546011)(71200400001)(186003)(9686003)(26005)(6506007)(7696005)(41300700001)(508600001)(33656002)(55016003)(966005)(86362001)(38070700005)(122000001)(41320700001)(83380400001)(52536014)(5660300002)(30864003)(8936002)(2906002)(38100700002)(76116006)(66446008)(66946007)(66556008)(54906003)(110136005)(64756008)(4326008)(8676002)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: fn0eG7bMlUrrrGL043UhJQ/RtXTPiEQsf1vJ8vmAhp6vyXujNF/03aiEheIj+emFYwKhZ7VL/moBv3WtA4/L5XbhcLFfrPjFzCHiS/JgFa5ArMxBJbUK91qvBXxhX9uSewtMRt1rqzl8/zQw70DYAJBuaPxUc0kp4mMtAXSqs9sv6uMiJGP9N9L8uZMdgeU1rXuW0YHhX4/u9oa0OoY6XSV26CHxzyqkBLqxyRJtb6CkwJlgRpDZGWxWHNU4InlOdb4S8r8GHoGSjARy+EhrtLrDx4bLaNkoCC0x0azlg0lQ19XPuFF8Lwarpfxda+EgayOv9RKftsy8hzrtN1LC5p/fn443bDvHXGtk6owz0u+4L/vOzDaLdhtT6B+wu+VPdSkDNiKAc9S0lZDooPI2Aopyvf1GtrYY/nOQd5vUhzI=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d2b7393-28c2-4d4b-e2cf-08da7a065c24
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2022 12:54:56.0504 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1602
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sW1gEsr2l+t2hsxhV6FMrK7J8mMO42gUB2hZrC94bRg=;
 b=AK5VkNwJiVbO3eWR80hSxGNjhYP3ZZ9qHm5eF2t3PMHf/g3VXj1We7qJi5SxH6U5iSjjP54r0muno2USzr1eZ++tBjcy6tIjfKffSruiqpmGk5xkCGXze7IlPUWlojiSo6oaVrPyznTiOjJOmaRblqKud3k6rpOxcjSoZrPPUH5J44rE8ZFtde+6UynT5qKO88cxXHrWzgQJuwCnfgAKrKcMX9oWdOXOyWsNRhMUp7AeD9uAiAUY5G484Fk0YYGQaM40m0p+X00TvHzTAfOReDB3jlRj5HW/Py7ldv1lLevA6UT93fM/fzA+qAa+SLr3craoZFcpyM9/52eCgcKRVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=AK5VkNwJ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] - Re: Python pyc only and problem with
 scripts
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Marcus Hoffmann <marcus.hoffmann@othermo.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All

> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Federico
> Pellegrin
> Sent: Monday, August 8, 2022 11:50 PM
> To: Arnout Vandecappelle <arnout@mind.be>
> Cc: Marcus Hoffmann <marcus.hoffmann@othermo.de>; Thomas Petazzoni
> <thomas.petazzoni@bootlin.com>; buildroot <buildroot@buildroot.org>
> Subject: [External] - Re: [Buildroot] Python pyc only and problem with scripts
> 
> 
> Hi Arnout, all!
> 
> 
> Il giorno lun 8 ago 2022 alle ore 22:48 Arnout Vandecappelle
> <arnout@mind.be <mailto:arnout@mind.be> > ha scritto:
> 
> 
> 
> 	> Indeed according to:
> 	>
> https://docs.python.org/3/install/#alternate-installation-unix-the-prefi
> x-scheme
> <https://docs.python.org/3/install/#alternate-installation-unix-the-pref
> ix-scheme>
> 	>
> <https://docs.python.org/3/install/#alternate-installation-unix-the-pref
> ix-scheme>
> 	> my understanding would be that they should indeed go to
> |/prefix//bin and not
> 	> with the modules.|
> 	> |This link
> 	>
> https://python-packaging.readthedocs.io/en/latest/command-line-scripts.h
> tml#the-scripts-keyword-argument
> <https://python-packaging.readthedocs.io/en/latest/command-line-scripts.
> html#the-scripts-keyword-argument>
> 	>
> <https://python-packaging.readthedocs.io/en/latest/command-line-scripts.
> html#the-scripts-keyword-argument>
> 	> also somehow confirms it I believe as also setuptools assume
> the possibility to
> 	> deliver them.
> 
> 	  I believe the proper way to install is to have a small script
> in /usr/bin/
> 	that simply imports the full script (relying on PYTHONPATH) and
> calls its main
> 	function.
> 
> 
> 
> Yes in principle that is something that you often see around, although
> I guess is mostly pointed at uses when you would like to both reuse some
> code as module and script. For Python scripts that don't have any
> potentially shareable code it may be an overhead and indeed you can find
> many around (will later try to catch some other in Buildroot besides
> rt-tests so we can have some more use-cases which maybe show us some
> other details).
> 
> 
> 
> 
> 	> So after all if rt-tests (or similar) would follow that,
> Buildroot py->pyc
> 	> should be safe, assuming that those script will not be
> converted.
> 
> 	  Given that rt-tests is not alone, I think it would be good if
> we could fix the
> 	issue on Buildroot side.
> 
> 	  I think the problem can be diagnosed when we encounter a .py
> file that is
> 	executable - normally they shouldn't be. We could simply leave
> those alone
> 	instead of removing them. Alternatively, perhaps it's possible
> to replace them
> 	with a symlink to the pyc file - although that may break things
> in horrible ways
> 	as well.
> 
> 
> 
> The first solution to not delete those py files (or not even generate
> pyc) sounds good to me in principle!

I'd argue that these modules should have a wrapper generated that imports the module and
executes it (as is standard) or that it should be invoked via `python3 -m <module> <args>`
instead of relying on a symlink. The pyc file will be imported as appropriate in these cases.

> 
> The second one to put a symlink to the pyc file will not work, as in
> that case you just get an error from the shell since the interpreter is
> not known if you try to execute it directly.
> 
> 
> 
> As for implementing the first solution I gave a fast look:
> 
> -) Not to remove the executable .py should be very easy, we should just
> add a check to the find that removes them in PYTHON3_REMOVE_PY_FILES,
> something along the lines of:
> 
> diff -ruN a/python3.mk <http://python3.mk>  b/python3.mk
> <http://python3.mk>
> --- a/python3.mk <http://python3.mk>         2022-08-02
> 03:59:45.897891945 +0200
> +++ b/python3.mk <http://python3.mk>         2022-08-09
> 04:36:40.798305233 +0200
> @@ -264,7 +264,7 @@
> 
>  ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
>  define PYTHON3_REMOVE_PY_FILES
> -       find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -
> name
> '*.py' \
> +       find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -
> name
> '*.py' \! -executable \
>                 $(if $(strip $(KEEP_PYTHON_PY_FILES)),-not \( $(call
> finddirclauses,$(TARGET_DIR),$(KEEP_PYTHON_PY_FILES)) \) ) \
>                 -print0 | \
>                 xargs -0 --no-run-if-empty rm -f
> 
> I did a small test with the above change and that would solve rt-tests
> case. On the other side I see that from a basic Python config I did this
> means also including/keeping a bunch of other files, which I'm not sure
> if they are executable by purpose or by chance/negligence, for example:
> 
> ./config-3.10-x86_64-linux-gnu/python-config.py
> ./profile.py
> ./tarfile.py
> ./quopri.py
> ./cgi.py
> ./socket.py
> ./uu.py
> ./timeit.py
> ./tabnanny.py
> ./turtledemo/paint.py
> ./turtledemo/penrose.py
> ./turtledemo/minimal_hanoi.py
> ./turtledemo/forest.py
> ./turtledemo/lindenmayer.py
> ./turtledemo/fractalcurves.py
> ./turtledemo/yinyang.py
> ./turtledemo/peace.py
> ./turtledemo/planet_and_moon.py
> ./turtledemo/tree.py
> ./turtledemo/__main__.py
> ./turtledemo/sorting_animate.py
> ./turtledemo/clock.py
> ./turtledemo/bytedesign.py
> ./webbrowser.py
> ./smtplib.py
> ./encodings/rot_13.py
> ./cProfile.py
> ./smtpd.py
> ./trace.py
> ./pydoc.py
> ./base64.py
> ./site-packages/hwlatdetect.py
> ./site-packages/get_cyclictest_snapshot.py
> ./platform.py
> ./pdb.py

Most, if not all, of these scripts support the `python -m <module> <args>` syntax which is important
since it then becomes unnecessary to know which explicit file provides the module you're trying to
execute. That said,  if you read PEP 3147, it's pretty clear that sourceless distributions are "legacy",
so anything we do is likely outside of the scope of what upstream intends to support. It may still be
worth having a discussion about long term support options

> 
> Just a fast look and some (ie. pdb.py) could be interesting to have as
> .py indeed, as this way you can easily invoke the Python debugger
> (otherwise with just the pyc you need to manually import and call main
> as the pyc will not execute directly). Same ie. for smtpd or base64 or
> webbrowser as you can then use them immediately (and with an additional
> command line parsing part). So after all maybe we were losing with the
> deletion of the py files also some other possibly useful delivered
> features.

See above.

It's also important to note that excluding executable files will not resolve the issue with PEP 517

https://github.com/pypa/pip/blob/main/src/pip/_vendor/pep517/in_process/__init__.py
```
return resources.path(__package__, '_in_process.py')
```

Where the path to a .py file is returned. This is probably fixable by stripping the extension and passing `-m` to the call in `wrappers.py`

```
            with _in_proc_script_path() as script:
                python = self.python_executable
                self._subprocess_runner(
                    [python, abspath(str(script)), hook_name, td],
                    cwd=self.source_dir,
                    extra_environ=extra_environ
                )
```

The other option is to explicitly exclude this special file from the compileall call via the `-x` argument.

> 
> 
> -) If we would like not to create the pyc at all as well it may be a
> little more work in recent versions. Indeed recently (end of July, so in
> master) Buildroot went from using the custom internal script
> "support/scripts/pycompile.py" to the Python shipped "compileall.py".
> For the old internal pycompile.py it would be very easy to just add a
> check on the executable-ness and skip the path (as we have a bunch of
> other checks, ie. is a link). But for the compileall.py as far as I can
> see there is no option to skip them and therefore patching this may be a
> bit more complex.
> 
> 
> But maybe for the scripts, which I guess should be a relatively small
> number of cases (in the above example out of 550 pyc files 35 would have
> the py left in place due to execution bit), just not removing the .py so
> they can still work correctly could be good enough after all ? (so, for
> executable Python files, one ends up with both .py and .pyc)
> 

Shouldn't known broken cases either be patched to work or prevent sourceless distribution?

> 
> 
> If you think the first point proposed makes sense, I can send an
> official patch.
> 
> 
> Cheers,
> Federico
> 
> 
> 
> 
> 
> 	  In either case, it's nice we have this rt-tests failure,
> because it means we
> 	can have a runtime test for it!
> 
> 	  Regards,
> 	  Arnout
> 
> 
> 	> |
> 	> |
> 	> |
> 	> |I'll try to contact the rt-tests team and see what they think
> of this and come
> 	> back with a patch for Buildroot!
> 	> |
> 	> |
> 	> |
> 	> |Cheers,|
> 	> |Federico
> 	> |
> 	> |
> 	> |
> 	>
> 	> Il giorno lun 8 ago 2022 alle ore 12:20 Thomas Petazzoni
> 	> <thomas.petazzoni@bootlin.com
> <mailto:thomas.petazzoni@bootlin.com>
> <mailto:thomas.petazzoni@bootlin.com
> <mailto:thomas.petazzoni@bootlin.com> >> ha scritto:
> 	>
> 	>     Hello Federico,
> 	>
> 	>     On Mon, 8 Aug 2022 09:40:02 +0200
> 	>     Federico Pellegrin <fede@evolware.org
> <mailto:fede@evolware.org>  <mailto:fede@evolware.org
> <mailto:fede@evolware.org> >> wrote:
> 	>
> 	>      > I've found a minor problem related to the rt-tests
> package, but that maybe
> 	>      > is slightly more generic and wanted to report and in
> case understand which
> 	>      > approach would be best to fix it (and contribute a
> patch then if possible).
> 	>      >
> 	>      > The specific problem: rt-tests, besides a few compiled
> executables,
> 	>      > installs also two tools which are written in Python,
> namely hwlatdetect and
> 	>      > get_cyclictest_snapshot. These are Python scripts which
> get installed in
> 	>      > the PYLIB and then a symbolic link is done from
> /usr/bin to them, so ie we
> 	>      > have: /usr/bin/hwlatdetect ->
> 	>      > /usr/lib/python3.10/site-packages//hwlatdetect.py
> 	>      >
> 	>      > Needless to say that once the pycompile.py script is
> run and original .py
> 	>      > files are removed, of course in the "PYC only" setup
> (which is the
> 	>      > default), then the link is broken and it will not work.
> 	>      > Additionally that pyc files will not work for scripts
> like that, so just
> 	>      > somehow fixing the link mentioned above would anyhow
> not work, as you need
> 	>      > to execute them eventually by explicitly naming the
> interpreter.
> 	>      >
> 	>      > I could imagine that we could have some similar other
> cases when we are
> 	>      > installing Python scripts directly executed in PYLIB
> and not modules. But
> 	>      > I'm not sure that installing the scripts there is a
> good idea as well,
> 	>      > comparing with other distros that doesn't seem to be
> the case.
> 	>      > So maybe the problem is really in rt-tests after all
> and the location those
> 	>      > scripts get installed and I may just fix it that way
> (and contact upstream)?
> 	>      > Otherwise should it be more generic maybe could make
> sense to have a
> 	>      > facility to list some files that should not be
> converted to PYC?
> 	>
> 	>     Thanks for your bug report.
> 	>
> 	>     My initial gut feeling would indeed be that it is strange
> to install
> 	>     scripts in /usr/lib/python, and they should be installed
> in /usr/bin
> 	>     instead, so that /usr/lib/python is only for Python
> modules that can be
> 	>     byte-compiled. However, I am not an expert at all in terms
> of Python
> 	>     best practices and latest standards.
> 	>
> 	>     But from a Buildroot perspective, it really makes a lot of
> sense to be
> 	>     able to do the byte-compilation at build-time (to save on
> startup time)
> 	>     and drop the .py files (to save on filesystem footprint).
> 	>
> 	>     For the rt-tests case, I would therefore suggest to move
> those scripts
> 	>     to /usr/bin.
> 	>
> 	>     Of course, if that problem shows up in more packages, then
> yes we could
> 	>     think of a mechanism for packages to declare a number of
> py files that
> 	>     should not be byte-compiled, and that should be preserved
> on the target.
> 	>
> 	>     Best regards,
> 	>
> 	>     Thomas
> 	>     --
> 	>     Thomas Petazzoni, co-owner and CEO, Bootlin
> 	>     Embedded Linux and Kernel engineering and training
> 	>     https://bootlin.com <https://bootlin.com>
> 	>
> 	>
> 	> _______________________________________________
> 	> buildroot mailing list
> 	> buildroot@buildroot.org <mailto:buildroot@buildroot.org>
> 	> https://lists.buildroot.org/mailman/listinfo/buildroot
> <https://lists.buildroot.org/mailman/listinfo/buildroot>
> 
> 
> CAUTION: This email originated from outside of the organization. Do not
> click links or open attachments unless you recognize the sender and know
> the content is safe.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
