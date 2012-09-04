From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 04 Sep 2012 07:53:17 +0200
Subject: [Buildroot] Bash string manipulation in Kconfig
In-Reply-To: <201209032207.47111.yann.morin.1998@free.fr>
References: <5044FD5F.102@petroprogram.com> <20120903210830.71b3372b@skate>
 <50450AD0.3060703@petroprogram.com>
 <201209032207.47111.yann.morin.1998@free.fr>
Message-ID: <5045974D.9010101@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/03/12 22:07, Yann E. MORIN wrote:
> Stefan, All,
>
> On Monday 03 September 2012 21:53:52 Stefan Fr?berg wrote:
>> 3.9.2012 22:08, Thomas Petazzoni kirjoitti:
>>> Le Mon, 03 Sep 2012 21:56:31 +0300,
>>> Stefan Fr?berg<stefan.froberg@petroprogram.com>  a ?crit :
>>>
>>>> But how to do similar in buildroot  .mk files ???
>>> 	$(notdir $(FOO))
>>>
>>> Thomas
>> One more question:
>>
>> Why does not the following work ?
>>
>> FULL_DOWNLOAD_URL=http://www.somedomain.com/blah/blah/somefile1
>> FULL_DOWNLOAD_URL+=http://www.somedomain2.com/blah2/blah2/blah/somefile2
>>
>> for i in $(FULL_DOWNLOAD_URL);do \
>>      echo $(notdir $$i) ; \
>> done
>>
>> I expect it to print:
>>
>> somefile1
>> somefile2
>>
>> But it prints instead:
>>
>> http://www.somedomain.com/blah/blah/somefile1
>> http://www.somedomain2.com/blah2/blah2/blah/somefile2
> That's because $(notdir ...) is onterpreted by make, while $i is
> interpreted by the shell.
>
> In your case, you'd want to use the shell constrcut:
>    for i in $(FULL_DOWNLOAD_URL);do \
>        echo $${i##*/} ; \
>    done
>

  Actually, in this case you just want
$(notdir $(FULL_DOWNLOAD_URL))

(the notdir function can take a list of filenames).


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
