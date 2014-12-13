From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 13 Dec 2014 17:46:50 +0100
Subject: [Buildroot] [v3,
	12/12] Add option for paranoid unsafe path checking
In-Reply-To: <1418485730.2167.11.camel@posteo.de>
References: <1418429047.1462.11.camel@posteo.de> <548B8601.8050109@openwide.fr>
 <1418479863.2167.3.camel@posteo.de> <548C5892.3070304@openwide.fr>
 <1418485730.2167.11.camel@posteo.de>
Message-ID: <CAHXCMMKzSjzwTQ7MRtMQJm1apK9AGf_dmfHCOxHPk=1UwLKQXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Dec 13, 2014 at 4:48 PM, J?rg Krause <jkrause@posteo.de> wrote:
> On Sa, 2014-12-13 at 16:17 +0100, Romain Naour wrote:
>> Hi J?rg,
>>
>> Le 13/12/2014 15:11, J?rg Krause a ?crit :
>> > On Sa, 2014-12-13 at 01:19 +0100, Romain Naour wrote:
>> >> Hello J?rg,
>> >>
>> >> Le 13/12/2014 01:04, J?rg Krause a ?crit :
>> >>> Hi Romain Naour,
>> >>>
>> >>> what should I do if a package build fails because of an unsafe path
>> >>> error? Propose a patch for the package?
>> >>>
>> >>
>> >> Yes, you needs patch the package's build system to remove the host path.
>> >
>> > Many thanks! So hostpad and wpa_supplicant need patches.
>>
>> You're welcome.
>
> Many thanks for the invitation :)
>
>> I didn't know that these packages were problems with the paranoid wrapper.
>
> make[1]: Entering directory
> '/home/joerg/Work/buildroot/output/build/wpa_supplicant-2.3/wpa_supplicant'
> arm-linux-gcc: WARNING: unsafe header/library path used in
> cross-compilation: '/usr/include/libnl3'
>
>>
>> >
>> >>
>> >> This error appear if one of the following paths is used during the
>> >> cross-compilation:
>> >> "/lib"
>> >> "/usr/include"
>> >> "/usr/lib"
>> >> "/usr/local/include"
>> >> "/usr/local/lib"
>> >
>> > One more question: Why are these pathes unsafe for cross-compilation?
>>
>> You have a good example here:
>> http://autobuild.buildroot.net/results/da0/da018caa1b79369bdff41d23b8696bc673625e1b/build-end.log
>>
>> perl-gd try to link with the host (x86_64) libraries wile cross-compiling for mipsel target.
>> It also include host headers path /usr/include
>>
>> This is this kind of error we want to avoid before adding a new package or bumping version.
>>
> I see. So instead of eg "/usr/include" "/include" should be used? And
> instead of "/lib" "/"?

Nope, just forget anything from /, this is wrong and not what is
needed for the target.
For the target, every material should be found in
$(O)/host/<target_tuple>/sysroot

So, instead of hard-coding absolute paths pointing to the host system,
the build system of the packages should:
- not add locations when they point to the defaults one.
  i.e. don't do "-I/usr/include", gcc already looks in this location,
the same for "-L/usr/lib" and "-L/lib"; so by default, a
cross-compiler will search in "<sysroot>/usr/include",
"<sysroot>/usr/lib" or "<sysroot>/lib";
- offer a way to set custom locations.
  e.g. if some headers are installed in
"<sysroot>/usr/include/foo/foo.h" and the build system expect
"-I/usr/include/foo" in its cflags, it should offer a way to pass the
foo header location for cross-compilation, i.e.
"-I<sysroot>/usr/include/foo"


Regards,

-- 
Samuel
