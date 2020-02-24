From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Mon, 24 Feb 2020 10:35:56 +0100
Subject: [Buildroot] [PATCH v3 12/12] support/scripts/pkg-stats: add
 status for cve check
In-Reply-To: <CAEyMn7aMdCg+20XLEOWA1Kp5QfEJg9Jd39JE9HeU0AQK3jH6NA@mail.gmail.com>
References: <20200222085715.23769-1-heiko.thiery@gmail.com>
 <20200222085715.23769-13-heiko.thiery@gmail.com>
 <6d3836ec-e228-77ef-df6c-6f3bd40fdf71@railnova.eu>
 <CAEyMn7aMdCg+20XLEOWA1Kp5QfEJg9Jd39JE9HeU0AQK3jH6NA@mail.gmail.com>
Message-ID: <eee5a274-dc79-6797-a52e-7416a9d0577a@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 2/24/20 8:06 AM, Heiko Thiery wrote:
> Hi Titouan and all,
> 
> Am So., 23. Feb. 2020 um 15:24 Uhr schrieb Titouan Christophe
> <titouan.christophe@railnova.eu>:
>>
>> Heiko, all,
>>
>> On 2/22/20 9:57 AM, Heiko Thiery wrote:
>>> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

[--SNIP--]

> 
>>
>> I would rather write it like this:
>>
>> ########################
>> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
>> index ed22f6b650..91477d583e 100755
>> --- a/support/scripts/pkg-stats
>> +++ b/support/scripts/pkg-stats
>> @@ -620,6 +620,12 @@ def check_package_cves(nvd_path, packages):
>>                if pkg_name in packages and cve.affects(packages[pkg_name]):
>>                    packages[pkg_name].cves.append(cve.identifier)
>>
>> +    for pkg_name, pkg in packages.items():
>> +        if len(pkg.cves) > 0:
>> +            pkg.status['cve'] = ('error', 'affected by CVE(s)')
>> +        else:
>> +            pkg.status['cve'] = ('ok', 'no CVE found')
>> +
> 
> Isn't it right that we loop then (depending on the amount of nvd
> pathes) several thousend times?
> 
> e.g. packages ~2600, nvds ~ 20 => 20*2600=52000

Except that each NVD file contains a few thousands CVEs :).

> 
> On the other hand we loop over the list of packages all over the place ;-/

Looping over all CVEs in a single NVD file yields 5 to 10 more 
iterations than looping over all packages (for instance year 2018 alone 
has 16039 CVE items)

> 
>>
>>    def calculate_stats(packages):
>>        stats = defaultdict(int)
>> ########################
>>
>>
>> Best regards,
>>
>> Titouan
