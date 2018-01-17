From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed, 17 Jan 2018 14:12:32 +0100
Subject: [Buildroot] [PATCH 14/14] ejabberd: Bump to version 17.11
In-Reply-To: <20180116220250.483dff36@windsurf>
References: <20180116140649.7381-1-johan.oudinet@gmail.com>
 <20180116140649.7381-15-johan.oudinet@gmail.com>
 <20180116220250.483dff36@windsurf>
Message-ID: <CAJtjsKY7XsNAFt79XvzqN7=+mWrLRyLgOmjrEKz0wSkHp+Ns=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for the quick feedback.

On Tue, Jan 16, 2018 at 10:02 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> On Tue, 16 Jan 2018 15:06:49 +0100, Johan Oudinet wrote:
>> * Adapt all patches.
>> * Use the new configure option enable-system-deps even though there is
>>   still a patch needed to correct includes.
>> * Disable graphics to not depends on X libraries. Disable also
>>   mod_avatar from the default loaded modules, since this module
>>   requires graphics enabled.
>> * Add a configure option to specify the Erlang cookie for users that do
>>   not want a random cookie generated at first boot.
>>
>> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
>
> Thanks for this update! Can I apply all the erlang package version
> bumps, even if I don't apply the ejabberd bump ?

Sure. I upgrade them to the same version as the one used by ejabberd
to avoid testing for incompatibilities myself but you can apply them
separately and it should work fine.

>
>> diff --git a/package/ejabberd/0004-correct-includes.patch b/package/ejabberd/0004-correct-includes.patch
>> new file mode 100644
>> index 0000000000..812bf6c5be
>> --- /dev/null
>> +++ b/package/ejabberd/0004-correct-includes.patch
>> @@ -0,0 +1,1909 @@
>> +From 0487178693143955ff57e3c9371fb6e7b164294c Mon Sep 17 00:00:00 2001
>> +From: Johan Oudinet <johan.oudinet@gmail.com>
>> +Date: Thu, 11 Jan 2018 12:49:38 +0100
>> +Subject: [PATCH] correct includes
>> +
>> +This part of the code was moved into it's own project and was packaged
>> +separately by me. To make the build process work, this small fix is
>> +necessary.
>> +Author: Philipp Huebner <debalance@debian.org>
>> +
>> +Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
>
> It is not entirely clear: is this patch already upstream?

I started from Philipp Huebner's patch on Debian's package for
ejabberd 17.11, but the patch format was not accepted by buildroot, so
I did it myself from ejabberd's git repository and copy-paste
Huebner's comment, including the Author line.
I used the following sed command:
for f in src/*.erl include/*.hrl; do
    sed -i -e 's,esip/include,s1_sip/include,g' \
             -e 's,include("ns.hrl,include_lib("p1_xmpp/include/ns.hrl,g' \
             -e 's,include("fxml.hrl,include_lib("p1_xml/include/fxml.hrl,g' \
             -e 's,include("xmpp\.hrl,include_lib("p1_xmpp/include/xmpp.hrl,g' \
             -e 's,include("jid\.hrl,include_lib("p1_xmpp/include/jid.hrl,g' \
             "$f"
done

What do you recommend me to do? I don't care of having my name in this patch.

>> +if BR2_PACKAGE_EJABBERD
>> +
>> +config BR2_PACKAGE_EJABBERD_ERLANG_COOKIE
>> +     string "Erlang cookie"
>> +     help
>> +       An alphanumeric string used by Erlang to authenticate nodes.
>> +       If empty, erlang creates a random cookie at first execution.
>
> Just curious, why is the Erlang cookie part of the Ejabberd
> configuration?

Good point. I added this functionality at the end of testing this
version to help me adding such file in the home directory of ejabberd
user for read-only rootfs. However, you right, it does not make much
sense to have this in Ejabberd configuration and it cannot be added in
Erlang's configuration neither, as the location depends on the user
who starts an Erlang application. It should be done in a post-build. I
guess I simply get rid of it in a second version of this patch. What
do you think?

>> +# Install an Erlang cookie if any is provided.
>> +ifneq ($(call qstrip,$(BR2_PACKAGE_EJABBERD_ERLANG_COOKIE)),)
>> +define EJABBERD_INSTALL_ERLANG_COOKIE
>> +     echo $(BR2_PACKAGE_EJABBERD_ERLANG_COOKIE) \
>
> Don't you need to $(call qstrip,...) the variable to remove the double
> quotes around the value ?

I had written in a previous version :
echo '$(call qstrip, $(FOO))' >'$(BAR)'
but figured out the quotes would be removed by the shell when
executing the echo command, so I could simplify it by removing both
the single quotes and the call to qstrip.

>
>> +     >'$(TARGET_DIR)/var/lib/ejabberd/.erlang.cookie'
>
> Why is this path between single quotes ?

In case TARGET_DIR has spaces.

Best,
-- 
Johan
