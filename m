From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed, 17 Jan 2018 16:49:13 +0100
Subject: [Buildroot] [PATCH 14/14] ejabberd: Bump to version 17.11
In-Reply-To: <20180117141956.5f83b38d@windsurf>
References: <20180116140649.7381-1-johan.oudinet@gmail.com>
 <20180116140649.7381-15-johan.oudinet@gmail.com>
 <20180116220250.483dff36@windsurf>
 <CAJtjsKY7XsNAFt79XvzqN7=+mWrLRyLgOmjrEKz0wSkHp+Ns=w@mail.gmail.com>
 <20180117141956.5f83b38d@windsurf>
Message-ID: <CAJtjsKYSySCBbjOeevxT_1Byk3Gsionuu4uNCOUu+ASdbUb6Kg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 17, 2018 at 2:19 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>> > It is not entirely clear: is this patch already upstream?
>>
>> I started from Philipp Huebner's patch on Debian's package for
>> ejabberd 17.11, but the patch format was not accepted by buildroot, so
>> I did it myself from ejabberd's git repository and copy-paste
>> Huebner's comment, including the Author line.
>> I used the following sed command:
>> for f in src/*.erl include/*.hrl; do
>>     sed -i -e 's,esip/include,s1_sip/include,g' \
>>              -e 's,include("ns.hrl,include_lib("p1_xmpp/include/ns.hrl,g' \
>>              -e 's,include("fxml.hrl,include_lib("p1_xml/include/fxml.hrl,g' \
>>              -e 's,include("xmpp\.hrl,include_lib("p1_xmpp/include/xmpp.hrl,g' \
>>              -e 's,include("jid\.hrl,include_lib("p1_xmpp/include/jid.hrl,g' \
>>              "$f"
>> done
>>
>> What do you recommend me to do? I don't care of having my name in this patch.
>
> That does not really answer the question I was asking: is the patch
> upstream? Has it been submitted? Will it be accepted?

This patch is in Debian but not in Ejabberd's upstream. I've talked by
email about this issue to people from Ejabberd and they told me they
will look into it.
In the meantime, this patch is necessary to compile Ejabberd as we
install these external libraries separately.

>> >> +config BR2_PACKAGE_EJABBERD_ERLANG_COOKIE
>> >> +     string "Erlang cookie"
>> >> +     help
>> >> +       An alphanumeric string used by Erlang to authenticate nodes.
>> >> +       If empty, erlang creates a random cookie at first execution.
>> >
>> > Just curious, why is the Erlang cookie part of the Ejabberd
>> > configuration?
>>
>> Good point. I added this functionality at the end of testing this
>> version to help me adding such file in the home directory of ejabberd
>> user for read-only rootfs. However, you right, it does not make much
>> sense to have this in Ejabberd configuration and it cannot be added in
>> Erlang's configuration neither, as the location depends on the user
>> who starts an Erlang application. It should be done in a post-build. I
>> guess I simply get rid of it in a second version of this patch. What
>> do you think?
>
> According to your description, it clearly doesn't seem to be related to
> the version bump, so whatever solution is chosen, it should be
> implemented as a separate patch from the version bump.
>
> Since I don't understand what this cookie is, I can't really suggest
> what is the good way to do it. For sure a post-build script +
> custom permission table allows to do that, so your option is not
> strictly necessary. But if everybody using ejabberd has to create this
> cookie file, it might make sense to have an option for it.
>
> If I understand correctly, this cookie is unique per machine, but must
> be preserved across reboots. Correct ?
>
> Also, this cookie is not system-wide, i.e each Erlang application, or
> at least each user (in the sense of /etc/passwd) must have this cookie
> for Erlang applications to not generate one upon first execution.
> Correct ?

Actually, this cookie is an authentication token to determine which
Erlang applications are allowed to communicate with each other. These
applications can be local or remote.
The official documentation about this cookie is here:
http://erlang.org/doc/reference_manual/distributed.html#id89236

So for Ejabberd, if I want to deploy a distributed xmpp server, I make
sure all machines in the deployment have the same content in
/var/lib/ejabberd/.erlang.cookie and that this file is preserved
across reboots.
Another solution would be to start every application with an extra
parameter --setcookie

Anyway, this is not related to the version bump.

>> I had written in a previous version :
>> echo '$(call qstrip, $(FOO))' >'$(BAR)'
>> but figured out the quotes would be removed by the shell when
>> executing the echo command, so I could simplify it by removing both
>> the single quotes and the call to qstrip.
>>
>> >
>> >> +     >'$(TARGET_DIR)/var/lib/ejabberd/.erlang.cookie'
>> >
>> > Why is this path between single quotes ?
>>
>> In case TARGET_DIR has spaces.
>
> There are gazillions of places where we don't quote
> STAGING_DIR/TARGET_DIR. We don't support spaces in the path to
> Buildroot directories currently, I'm sure lots of things would break if
> you were to build in a folder with spaces.

Ok.

-- 
Johan
