From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 11 Feb 2017 22:19:36 +0100
Subject: [Buildroot] [PATCH 1/6] support/scripts: add script to test a
	package
In-Reply-To: <20170211160824.GA20146@free.fr>
References: <cover.1486584734.git.yann.morin.1998@free.fr>
 <085941ea3e9e9f34405ac10780d5c8aa2a6317aa.1486584734.git.yann.morin.1998@free.fr>
 <70e8.589b94e3.db816@xdna.net> <20170211160824.GA20146@free.fr>
Message-ID: <CAAXf6LVR03z=HfgkN8QNpawG4G0WYvFmjswiexSCX2icw1dzvQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Feb 11, 2017 at 5:08 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Cam, All,
>
> Since you did not Cc me on that mail, I only noticed it now...
>
> On 2017-02-08 22:00 -0000, Cam Hutchison spake thusly:
>> "Yann E. MORIN" <yann.morin.1998@free.fr> writes:
>> >This script helps in testing that a package builds fine on a wide range
>> >of architectures and toolchains: BE/LE, 32/64-bit, musl/glibc/uclibc...
> [--SNIP--]
>> >+    if [ ${#toolchains[@]} -eq 0 ]; then
>> >+        printf "error: no toolchain found (networking issue?)\n" >&2; exit 1
>>
>> The format string should be in single quotes as it contains a glob char.
>
> Nope, wildcards are not expanded in double quotes (as you then noticed).
>
>> I usually put all printf format strings in single quotes since printf is
>> doing the substitutions, not the shell.
>
> I tend to agree on the principle: format strings should be
> single-quoted. But then we have disparate quoting styles, and I don;t
> like it. I prefer a single quoting style...
>
> But your point is valid as well.
>
> [--SNIP--]
>> >+    while read line; do
>> >+        if ! grep "^${line}\$" "${dir}/.config" >/dev/null 2>&1; then
>>
>> You should use grep -Fx here since ${line} might contains regex chars:
>>
>>         if ! grep -Fx "${line}" "${dir}/.config" >/dev/null 2>&1; then
>>
>> ....
>>
>> >+            printf ", SKIPPED\n"
>> >+            return
>> >+        fi
>> >+    done <"${cfg}"
>>
>> .... but I'd get rid of the loop altogether and use comm(1); something like:
>>
>>     if [ -n "$( comm -23 <(sort "${cfg}") <(sort "${dir/.config}") )" ]; then
>>         printf ", SKIPPED\n"
>>       return
>>     fi
>
> Yup, I'll take a look at using comm instead. Thanks for the tip! :-)
>

Here is a feature request, but only if it does not add much
complexity: I was expecting the script to accept this:

echo "BR2_PACKAGE_BUSYBOX=y" | support/scripts/test-pkg -p busybox -c -

i.e. let '-' indicate that the config snippet is to be taken from
standard input, a principle supported by many unix tools already.
The 'echo' could be more complex in someone else's use case, for
example a concatenation of several pre-existing snippets.

Best regards,
Thomas
