From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 3 Oct 2017 07:55:15 -0500
Subject: [Buildroot] [PATCH] vboot-utils: disable static futility
In-Reply-To: <CANQCQpb76ZKCxDbaT+sbSQF3fO99DRQaJp1Ty0xYi+nX+GU+Qg@mail.gmail.com>
References: <20171003083737.GA3986@latitude.localdomain>
 <CANQCQpb76ZKCxDbaT+sbSQF3fO99DRQaJp1Ty0xYi+nX+GU+Qg@mail.gmail.com>
Message-ID: <CANQCQpaXSt4Jo5cZam0rb7-9Zh0Yj0wE5w5wyJfapi6VUjvn+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alex,

On Tue, Oct 3, 2017 at 7:45 AM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> Alex,
>
> On Tue, Oct 3, 2017 at 3:37 AM, Alex Suykov <alex.suykov@gmail.com> wrote:
>>
>> Possibly fixes
>> http://autobuild.buildroot.net/results/fbe/fbe7892539cc1bf18f89d18c6609a5aa747647d0/
>> http://autobuild.buildroot.net/results/4bc/4bc388618ff02dde26ae09db021434a936c8cc1b/
>> and similar errors.
>
> I'll take a look and see if it works.  The patch looks like it
> completely disables building of static bins for target and host.  Is
> that intended?

Confirmed, resolves the build failures above, but I'm still curious
about my previous question.

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>

>
>>
>> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
>> ---
>> Please note this is a blind fix. I cannot reproduce the build errors,
>> which all happen on the same build node, and I cannot verify that
>> the patch does in fact fix them.
>>
>> It's probably still a good idea to avoid unnecessary static linking
>> in a host package.
>>
>>  .../vboot-utils/0004-Disable-static-futility.patch | 30 ++++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>  create mode 100644 package/vboot-utils/0004-Disable-static-futility.patch
>>
>> diff --git a/package/vboot-utils/0004-Disable-static-futility.patch b/package/vboot-utils/0004-Disable-static-futility.patch
>> new file mode 100644
>> index 0000000000..574476d340
>> --- /dev/null
>> +++ b/package/vboot-utils/0004-Disable-static-futility.patch
>> @@ -0,0 +1,30 @@
>> +The package attempts to build a statically-linked host binary, futility_s,
>> +which is not used anywhere in buildroot but may be causing build failures
>> +if the build host lacks static libc.
>> +
>> +Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
>> +
>> +--- a/Makefile
>> ++++ b/Makefile
>> +@@ -1079,7 +1079,7 @@
>> + # new Firmware Utility
>> +
>> + .PHONY: futil
>> +-futil: ${FUTIL_STATIC_BIN} ${FUTIL_BIN}
>> ++futil: ${FUTIL_BIN}
>> +
>> + ${FUTIL_STATIC_BIN}: ${FUTIL_STATIC_OBJS} ${UTILLIB}
>> +       @${PRINTF} "    LD            $(subst ${BUILD}/,,$@)\n"
>> +@@ -1091,10 +1091,10 @@
>> +       ${Q}${LD} -o $@ ${CFLAGS} ${LDFLAGS} $^ ${LDLIBS}
>> +
>> + .PHONY: futil_install
>> +-futil_install: ${FUTIL_BIN} ${FUTIL_STATIC_BIN}
>> ++futil_install: ${FUTIL_BIN}
>> +       @${PRINTF} "    INSTALL       futility\n"
>> +       ${Q}mkdir -p ${UB_DIR}
>> +-      ${Q}${INSTALL} -t ${UB_DIR} ${FUTIL_BIN} ${FUTIL_STATIC_BIN}
>> ++      ${Q}${INSTALL} -t ${UB_DIR} ${FUTIL_BIN}
>> +       ${Q}for prog in ${FUTIL_SYMLINKS}; do \
>> +               ln -sf futility "${UB_DIR}/$$prog"; done
>> +
>> --
>> 2.14.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
>
>
> --
> Matthew L Weber / Pr Software Engineer
> Airborne Information Systems / Security Systems and Software / Secure Platforms
> MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
> www.rockwellcollins.com
>
> Note: Any Export License Required Information and License Restricted
> Third Party Intellectual Property (TPIP) content must be encrypted and
> sent to matthew.weber at corp.rockwellcollins.com.



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
