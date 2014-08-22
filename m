From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 22 Aug 2014 09:17:50 +0200
Subject: [Buildroot] [PATCH 1/2] package/pkg-autotools: don't use
 config.site when cross-compiling
In-Reply-To: <53F669B1.505@openwide.fr>
References: <1408402240-3126-1-git-send-email-romain.naour@openwide.fr>
 <CAAXf6LUe-9r7NhjqGNuRrM7SufuixOx8Z8LSnVcKhcrdy+-HSw@mail.gmail.com>
 <53F66250.50800@openwide.fr> <20140821163213.65ee473e@core2quad.morethan.org>
 <53F669B1.505@openwide.fr>
Message-ID: <CAAXf6LXeRtVGfppZXJiY13=10=yyikQxV5++4kcRwKy3e307pQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Aug 21, 2014 at 11:50 PM, Romain Naour <romain.naour@openwide.fr> wrote:
> Hi Mike,
>
> Le 21/08/2014 23:32, Mike Zick a ?crit :
>> On Thu, 21 Aug 2014 23:19:12 +0200
>> Romain Naour <romain.naour@openwide.fr> wrote:
>>
>>> Hi Thomas,
>>>
>>> Le 21/08/2014 22:06, Thomas De Schampheleire a ?crit :
>>>> Hi Romain,
>>>>
>>>> On Tue, Aug 19, 2014 at 12:50 AM, Romain Naour
>>>> <romain.naour@openwide.fr> wrote:
>>>>> On fedora 20 64bits host, the file /usr/share/config.site contains
>>>>> a fix for installing libraries into /lib/lib64 on 64bits systems
>>>>> that redefine libdir in the generated Makefile
>>>>>
>>>>> For safety, disable loading this file when running the configure
>>>>> script for the target and the host.
>>>>>
>>>>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>>>>> ---
>>>>>  package/pkg-autotools.mk | 2 ++
>>>>>  1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
>>>>> index bcc648d..cdc31bf 100644
>>>>> --- a/package/pkg-autotools.mk
>>>>> +++ b/package/pkg-autotools.mk
>>>>> @@ -126,6 +126,7 @@ define $(2)_CONFIGURE_CMDS
>>>>>         $$(TARGET_CONFIGURE_OPTS) \
>>>>>         $$(TARGET_CONFIGURE_ARGS) \
>>>>>         $$($$(PKG)_CONF_ENV) \
>>>>> +       CONFIG_SITE="no" \
>>>>>         ./configure \
>>>>>                 --target=$$(GNU_TARGET_NAME) \
>>>>>                 --host=$$(GNU_TARGET_NAME) \
>>>>> @@ -159,6 +160,7 @@ define $(2)_CONFIGURE_CMDS
>>>>>                 CFLAGS="$$(HOST_CFLAGS)" \
>>>>>                 LDFLAGS="$$(HOST_LDFLAGS)" \
>>>>>                  $$($$(PKG)_CONF_ENV) \
>>>>> +               CONFIG_SITE="no" \
>>>>>                 ./configure \
>>>>>                 --prefix="$$(HOST_DIR)/usr" \
>>>>>                 --sysconfdir="$$(HOST_DIR)/etc" \
>>>>
>>>> The autoconf documentation does not specify 'no' as a magic value,
>>>> which means that the accidental presence of a file called 'no' would
>>>> pick up the file.
>>>> Wouldn't it be safer/cleaner to use CONFIG_SITE=/dev/null?
>>>> Note that I have not tested if this actually works, just a thought.
>>>
>>> I tried with CONFIG_SITE="/dev/null" at first but I had
>>> configure: loading site script /dev/null
>>>
>>> I may use THIS_IS_NOT_YOUR_CONFIG_SITE instead :)
>>>
>>
>> Let me guess, that would result in something like:
>> configure: site script THIS_IS_NOT_YOUR_CONFIG_SITE not found
>
> No, there is no print at all.
>
>>

The logic in the configure script of host-localedef is:

ac_site_file1=NONE
ac_site_file2=NONE
if test -n "$CONFIG_SITE"; then
  # We do not want a PATH search for config.site.
  case $CONFIG_SITE in #((
    -*)  ac_site_file1=./$CONFIG_SITE;;
    */*) ac_site_file1=$CONFIG_SITE;;
    *)   ac_site_file1=./$CONFIG_SITE;;
  esac
elif test "x$prefix" != xNONE; then
  ac_site_file1=$prefix/share/config.site
  ac_site_file2=$prefix/etc/config.site
else
  ac_site_file1=$ac_default_prefix/share/config.site
  ac_site_file2=$ac_default_prefix/etc/config.site
fi
for ac_site_file in "$ac_site_file1" "$ac_site_file2"
do
  test "x$ac_site_file" = xNONE && continue
  if test /dev/null != "$ac_site_file" && test -r "$ac_site_file"; then
    { $as_echo "$as_me:${as_lineno-$LINENO}: loading site script
$ac_site_file" >&5

Which means that:

if CONFIG_SITE=NONE,
    ac_site_file1=./NONE --> file not readable, exit
    ac_site_file2=NONE --> NONE, exit

if CONFIG_SITE=no, the same behavior as with NONE (./no and NONE)

if CONFIG_SITE=/dev/null,
    ac_site_file1=/dev/null --> /dev/null, exit
    ac_site_file2=NONE --> NONE, exit

So according to me, /dev/null looks like the cleanest solution.
However, Romain said that this would also print the message, which is
not correct in my tests. Maybe it depends on the version of autoconf
used?

Romain, are you sure there is a message printed when using /dev/null ?

Thanks,
Thomas
