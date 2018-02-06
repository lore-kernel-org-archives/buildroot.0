From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Feb 2018 13:41:24 +0100
Subject: [Buildroot] [PATCH 1/1] core: rename FOO_BASE_NAME to
 FOO_BASENAME to avoid clashes
In-Reply-To: <20180206101318.GX20598@australia.be.alcatel-lucent.com>
References: <20180205142914.GR20598@australia.be.alcatel-lucent.com>
 <20180205145450.GC2417@scaer>
 <20180206101318.GX20598@australia.be.alcatel-lucent.com>
Message-ID: <e9bc5d7a-1baa-3fb8-c490-557e703ec5fb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-02-18 11:13, Thomas De Schampheleire wrote:
> On Mon, Feb 05, 2018 at 03:54:50PM +0100, Yann E. MORIN wrote:
>> Thomas, All,
>>
>> Quick review before in-depth review and testing...
>>
>> On 2018-02-05 15:29 +0100, Thomas De Schampheleire spake thusly:
>>> In current Buildroot, clashes occur between the variables _NAME and
>>> _BASE_NAME for two packages called foo and foo-base, i.e.
>>>
>>> Package foo:
>>> FOO_NAME = foo
>>> FOO_BASE_NAME = foo-1.2.3
>>>
>>> Package foo-base:
>>> FOO_BASE_NAME = foo-base
>>> FOO_BASE_BASE_NAME = foo-base-4.5.6
>>>
>>> where variable FOO_BASE_NAME is clashing between these two packages.
>>>
>>> The problem is generic and can occur for a number of variables in Buildroot.
>>> One solution is to use a different separator than '_' to separate the
>>> package name from the rest of the variable name. For example:
>>> FOO_NAME could become FOO.NAME, FOO-NAME, or something else.
>>> Then, in the example we would have following non-clashing variables:
>>> FOO.NAME
>>> FOO.BASE_NAME
>>> FOO_BASE.NAME
>>> FOO_BASE.BASE_NAME
>>
>> Another isadvantage is that those variables are not valid shell
>> variables, so we ca=ould no longer use constructs like:
>>
>>     eval $(make -s printvars VARS=FOO.BASE_NAME)
>>
>> or similar...
>>
>> But this is also an advantage, in that those variable won't accidentally
>> leak into the environment of _CMDS...
>>
>> But the disadvantage is more critical.
> 
> Yes, we didn't think of that.
> 
>>
>>> However, making that change for only this case means that the variable
>>> naming is no longer consistent. And making the change for all variables has
>>> a large impact, also on certain user scripts.
>>>
>>> For now, keep it simple, and rename FOO_BASE_NAME into FOO_BASENAME, so that
>>> the variables become:
>>> FOO_NAME
>>> FOO_BASENAME
>>> FOO_BASE_NAME
>>> FOO_BASE_BASENAME
>>
>> You're listing _NAME and _BASENAME, but are also changing _RAW_BASENAME.
> 
> Yes, I thought it would have been odd to have
> FOO_BASENAME
> and
> FOO_RAW_BASE_NAME
> 
> so I aligned RAW_BASENAME as well.
> 
> This still exposes a problem with foo-raw, as Cam Hutchingson also mentioned,
> but this is not the only remaining problem.
> 
> Renaming FOO_RAW_BASE_NAME into FOO_BASENAME_RAW solves that problem, because
> there is no internal variable 'FOO_RAW'.
> 
> It still doesn't solve other possible variable clashes, like DL_DIR for 'foo'
> with DIR for 'foo-dl'. But as we said, doing the full fix has some disadvantages
> as well.

 We have a list of other conflicts in the BR meeting report, would be nice to
include that list in the commit message for easy reference.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
