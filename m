From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 17 Nov 2015 18:35:24 +0100
Subject: [Buildroot] [PATCH 04/21 RFC] core/legal-info: allow ignoring
 packages from the legal-info
In-Reply-To: <20151117122226.0cbd8042@free-electrons.com>
References: <cover.1447713615.git.yann.morin.1998@free.fr>
 <5d993adab02ed57f67d14652247fbd31aaae87bc.1447713615.git.yann.morin.1998@free.fr>
 <20151117122226.0cbd8042@free-electrons.com>
Message-ID: <564B655C.5060105@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas, Yann, All,

Thomas Petazzoni wrote:
> Yann, Luca,
>
> On Mon, 16 Nov 2015 23:46:59 +0100, Yann E. MORIN wrote:
>> It might be necessary to not even mention a package in the output of
>> legal-info:
>>
>>    - virtual package have virtually nothing to save in the legal-info
>>      output;
>>
>>    - for Buildroot itself, host-gcc-initial and host-gcc-final are not
>>      real packages, they are just two different steps of the same
>>      package, gcc;
>>
>>    - for proprietary packages, it might not even be legal to even mention
>>      them, being under NDA or some other such restrictive conditions.
>>
>> Add the new 'IGNORE' keyword to the _REDISTRIBUTE package variable, so
>> that the legal-info infra will simply completely ignore that package.
>>
>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> Cc: Luca Ceresoli <luca@lucaceresoli.net>
>
> I understand the idea, but I'm not a big fan of a boolean variable that
> is no longer a boolean variable.
>
> So, let me question the current handling of <pkg>_REDISTRIBUTE = NO.
> Does it make sense to mention such packages in the legal-info output,
> since their source code is not saved anyway?
>
> Shouldn't we simply change the behavior of <pkg>_REDISTRIBUTE = NO to
> be that such packages are not listed at all in the legal-info output,
> which would match what you're looking for for with this "IGNORE" thing ?
>
> Luca, do you see any drawback in completely omitting REDISTRIBUTE = NO
> packages from legal-info ?

Indeed I think we need that behaviour for some binary-only packages.
imx-vpu looks like a good example. Its COPYING file contains the
following clause:

> 3.4.             You must reproduce any and all of Freescale's (or its third
> party licensor's) copyright notices and other proprietary legends on copies of
> Licensed Software.

To the best of my understanding this means we must mention the package
and its legal wording in legal-info.

Thus your proposed change of meaning for REDISTRIBUTE = NO is probably
not doable.

How about changing the entire REDISTRIBUTE meaning from a boolean to an
enumerative? Values would be:

  - ALL: equals current YES
  - METADATA: equals current NO, produces no tarball
  - NOTHING: equals Yann's IGNORE
  - YES: deprecated, for backward compatibility
  - NO: deprecated, for backward compatibility

In other words, change the meaning of REDISTRIBUTE from "do you want to
redistribute the tarball?" to "what do you want to redistribute?".

-- 
Luca
