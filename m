From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 19 Jun 2017 21:32:57 +0200
Subject: [Buildroot] [PATCH 0/3] core: check hashes of license files
In-Reply-To: <20170619174707.GB3045@scaer>
References: <cover.1497772831.git.yann.morin.1998@free.fr>
 <CA+NV+Vmd+uwWztf4Po71Kh3WHPVzPR++HSUdmBoF1oddsS14ew@mail.gmail.com>
 <20170619174707.GB3045@scaer>
Message-ID: <CAAXf6LVAgOoLDEc-HUJJOOm9Oq8k5cG5q2VkK+ZNVJyGhtM4Cw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-06-19 19:47 GMT+02:00 Yann E. MORIN <yann.morin.1998@free.fr>:
> Rahul, All,
>
> On 2017-06-19 22:47 +0530, Rahul Bedarkar spake thusly:
>> On Sun, Jun 18, 2017 at 1:31 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> >
>> > Hello All!
>> >
>> > This small series is a proposal to check the hashes of the license files
>> > during legal-info, to catch the packages whose license changes but where
>> > the text of the new license is in the same file.
>>
>> Thanks for this series. Checking hashes of the license files during
>> legal-info stage looks logical but we discussed about doing that after
>> downloading sources so that change in license file is noticed early
>> (as a part of build test after version bump).
>
> It is not possible to do at download time. It can only be done after
> the package has been extracted and patched.
>
> That is why, when you run legal-info on a non-built (but configured)
> tree, you'll notice that Buildroot extracts and patches the packages
> before saving their legal-info.
>
> Besides, if one uses the support/scripts/test-pkg script to test the
> version bump, then legal-info is run by the script.
>
> So, I still believe it is better done during legal-info.
>

Yann, I think Rahul means that the checking of the hashing should be
checked as part of the standard 'make pkg' target, whichever subtarget
it is, be it -build, -install or what not.

But, I don't think we should mix such topics: legal info topics should
stay in the -legal-info target.
One solution could be to make '-legal-info' part of the standard build
process, although it will slow down the build and some/many people
will not like that.
An alternative is to split '-legal-info' in two parts:
-legal-info-checks and actual -legal-info. The first part would verify
some important things, i.e. presence of valid LICENSE, presence of all
files specified in LICENSE_FILES, hash checking on these files. It
could be added to the standard 'make pkg' group. The second part would
do the actual creation of the manifest, copying the sources, etc. and
remains on-demand only.

I don't know what you think of that approach, I'm thinking out loud.

/Thomas
