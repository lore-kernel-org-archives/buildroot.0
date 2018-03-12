From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 12 Mar 2018 13:37:52 +0100
Subject: [Buildroot] [PATCH v3 2/2] python-psycopg2: new package
In-Reply-To: <CAFSsvmrrq1b6aGvY1QpN3h0MBAdQjDbi-XnG_KeTo_sDtwSVvw@mail.gmail.com>
References: <20180312101231.2280-1-aduskett@gmail.com>
 <20180312101231.2280-2-aduskett@gmail.com>
 <CAGm1_ksayD-5RFa6RVadxrr6VTZHZ7SvHta4SgN3WkpqPeq+dg@mail.gmail.com>
 <CAFSsvmrrq1b6aGvY1QpN3h0MBAdQjDbi-XnG_KeTo_sDtwSVvw@mail.gmail.com>
Message-ID: <CAGm1_ks6g3VPXCfZk+yzP_jq_bDFyXr3i4wJ02SeBzB2+gNf2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 12, 2018 at 12:26 PM, Adam Duskett <aduskett@gmail.com> wrote:
> Hey Yegor;
>
> On Mon, Mar 12, 2018 at 6:34 AM, Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
>> On Mon, Mar 12, 2018 at 11:12 AM, Adam Duskett <aduskett@gmail.com> wrote:
>>> Psycopg is the most popular PostgreSQL database adapter for the Python
>>> programming language. Its main features are the complete implementation of the
>>> Python DB API 2.0 specification and the thread safety (several threads can
>>> share the same connection). It was designed for heavily multi-threaded
>>> applications that create and destroy lots of cursors and make a large number of
>>> concurrent INSERTs or UPDATEs.
>>>
>>> Signed-off-by: Adam Duskett <aduskett@gmail.com>
>>> ---
>>> Changes v1 -> v2:
>>>   - None
>>>
>>> Changes v2 -> v3:
>>>   - Removed python-psycopg2/0001-don-t-use-pg_config.patch
>>>   - Added PYTHON_PSYCOPG2_BUILD_OPTS and PYTHON_PSYCOPG2_INSTALL_TARGET_OPTS
>>>     to point towards Buildroots own pg_config file. (Thomas)
>>>   - Updated to 2.7.4
>>>
>>>  DEVELOPERS                                   |  1 +
>>>  package/Config.in                            |  1 +
>>>  package/python-psycopg2/Config.in            | 22 ++++++++++++++++++++++
>>>  package/python-psycopg2/python-psycopg2.hash |  4 ++++
>>>  package/python-psycopg2/python-psycopg2.mk   | 21 +++++++++++++++++++++
>>>  5 files changed, 49 insertions(+)
>>>  create mode 100644 package/python-psycopg2/Config.in
>>>  create mode 100644 package/python-psycopg2/python-psycopg2.hash
>>>  create mode 100644 package/python-psycopg2/python-psycopg2.mk
>>>
>>> diff --git a/DEVELOPERS b/DEVELOPERS
>>> index 3df820e712..6329bcde2d 100644
>>> --- a/DEVELOPERS
>>> +++ b/DEVELOPERS
>>> @@ -53,6 +53,7 @@ F:    package/nginx-naxsi/
>>>  F:     package/policycoreutils/
>>>  F:     package/python-flask-sqlalchemy/
>>>  F:     package/python-mutagen/
>>> +F:     package/python-psycopg2/
>>>  F:     package/python-sqlalchemy/
>>>  F:     package/restorecond/
>>>  F:     package/refpolicy/
>>> diff --git a/package/Config.in b/package/Config.in
>>> index 449ffcc47b..d40170ccf9 100644
>>> --- a/package/Config.in
>>> +++ b/package/Config.in
>>> @@ -856,6 +856,7 @@ menu "External python modules"
>>>         source "package/python-prompt-toolkit/Config.in"
>>>         source "package/python-protobuf/Config.in"
>>>         source "package/python-psutil/Config.in"
>>> +       source "package/python-psycopg2/Config.in"
>>>         source "package/python-ptyprocess/Config.in"
>>>         source "package/python-pudb/Config.in"
>>>         source "package/python-pyasn/Config.in"
>>> diff --git a/package/python-psycopg2/Config.in b/package/python-psycopg2/Config.in
>>> new file mode 100644
>>> index 0000000000..ec852bb49e
>>> --- /dev/null
>>> +++ b/package/python-psycopg2/Config.in
>>> @@ -0,0 +1,22 @@
>>> +config BR2_PACKAGE_PYTHON_PSYCOPG2
>>> +       bool "python-psycopg2"
>>> +       select BR2_PACKAGE_POSTGRESQL
>>> +       help
>>> +         Psycopg is the most popular PostgreSQL database adapter for
>>> +         the Python programming language. Its main features are the
>>> +         complete implementation of the Python DB API 2.0 specification
>>> +         and the thread safety (several threads can share the same
>>> +         connection). It was designed for heavily multi-threaded
>>> +         applications that create and destroy lots of cursors and make
>>> +         a large number of concurrent INSERTs or UPDATEs.
>>> +
>>> +         Psycopg 2 is mostly implemented in C as a libpq wrapper,
>>> +         resulting in being both efficient and secure. It features
>>> +         client-side and server-side cursors, asynchronous
>>> +         communication and notifications, COPY support. Many Python
>>> +         types are supported out-of-the-box and adapted to matching
>>> +         PostgreSQL data types; adaptation can be extended and
>>> +         customized thanks to a flexible objects adaptation system.
>>> +         Psycopg 2 is both Unicode and Python 3 friendly.
>>> +
>>> +         http://initd.org/psycopg/
>>
>> Postgresql deps are missing:
>>
>> comment "postgresql needs a toolchain w/ dynamic library"
>>         depends on BR2_STATIC_LIBS
>>
>> With these changes applied you can add my
>>
>> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
>>
>> Yegor
>>
> This isn't necessary is it? psycopg2 can't be selected unless
> python2/3 is selected, and those
> require a dynamic library.

You're right.

Yegor

> Adam
>
>>> diff --git a/package/python-psycopg2/python-psycopg2.hash b/package/python-psycopg2/python-psycopg2.hash
>>> new file mode 100644
>>> index 0000000000..ea4a07697b
>>> --- /dev/null
>>> +++ b/package/python-psycopg2/python-psycopg2.hash
>>> @@ -0,0 +1,4 @@
>>> +# md5 from https://pypi.python.org/pypi/psycopg2/json, sha256 locally computed
>>> +md5    70fc57072e084565a42689d416cf2c5c  psycopg2-2.7.4.tar.gz
>>> +sha256 8bf51191d60f6987482ef0cfe8511bbf4877a5aa7f313d7b488b53189cf26209  psycopg2-2.7.4.tar.gz
>>> +sha256 1752db3c786e12b62ca804178dca033adce8bff4c4b3d98d3449d407fe45210d  LICENSE
>>> diff --git a/package/python-psycopg2/python-psycopg2.mk b/package/python-psycopg2/python-psycopg2.mk
>>> new file mode 100644
>>> index 0000000000..3cb8c85778
>>> --- /dev/null
>>> +++ b/package/python-psycopg2/python-psycopg2.mk
>>> @@ -0,0 +1,21 @@
>>> +################################################################################
>>> +#
>>> +# python-psycopg2
>>> +#
>>> +################################################################################
>>> +
>>> +PYTHON_PSYCOPG2_VERSION = 2.7.4
>>> +PYTHON_PSYCOPG2_SOURCE = psycopg2-$(PYTHON_PSYCOPG2_VERSION).tar.gz
>>> +PYTHON_PSYCOPG2_SITE = https://pypi.python.org/packages/74/83/51580322ed0e82cba7ad8e0af590b8fb2cf11bd5aaa1ed872661bd36f462
>>> +PYTHON_PSYCOPG2_SETUP_TYPE = setuptools
>>> +PYTHON_PSYCOPG2_LICENSE = LGPL-3.0+
>>> +PYTHON_PSYCOPG2_LICENSE_FILES = LICENSE
>>> +PYTHON_PSYCOPG2_DEPENDENCIES = postgresql
>>> +
>>> +# Force psycopg2 to use the BuildRoot provided postgresql version instead of
>>> +# The host machines
>>> +PYTHON_PSYCOPG2_BUILD_OPTS += build_ext --pg-config=$(STAGING_DIR)/usr/bin/pg_config
>>> +
>>> +PYTHON_PSYCOPG2_INSTALL_TARGET_OPTS += build_ext --pg-config=$(STAGING_DIR)/usr/bin/pg_config
>>> +
>>> +$(eval $(python-package))
>>> --
>>> 2.14.3
>>>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> http://lists.busybox.net/mailman/listinfo/buildroot<div class="gmail_extra"><br><div class="gmail_quote">On Mon, Mar 12, 2018 at 11:12 AM, Adam Duskett <span dir="ltr">&lt;<a href="mailto:aduskett@gmail.com" target="_blank">aduskett at gmail.com</a>&gt;</span> wrote:<br><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Psycopg is the most popular PostgreSQL database adapter for the Python<br>
>> programming language. Its main features are the complete
>> implementation of the<br>
>> Python DB API 2.0 specification and the thread safety (several threads can<br>
>> share the same connection). It was designed for heavily multi-threaded<br>
>> applications that create and destroy lots of cursors and make a large
>> number of<br>
>> concurrent INSERTs or UPDATEs.<br>
>> <br>
>> Signed-off-by: Adam Duskett &lt;<a
>> href="mailto:aduskett at gmail.com">aduskett at gmail.com</a>&gt;<br>
>> ---<br>
>> Changes v1 -&gt; v2:<br>
>> &nbsp; - None<br>
>> <br>
>> Changes v2 -&gt; v3:<br>
>> &nbsp; - Removed python-psycopg2/0001-don-t-<wbr>use-pg_config.patch<br>
>> &nbsp; - Added PYTHON_PSYCOPG2_BUILD_OPTS and
>> PYTHON_PSYCOPG2_INSTALL_<wbr>TARGET_OPTS<br>
>> &nbsp; &nbsp; to point towards Buildroots own pg_config file. (Thomas)<br>
>> &nbsp; - Updated to 2.7.4<br>
>> <br>
>> &nbsp;DEVELOPERS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
>> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
>> &nbsp;|&nbsp; 1 +<br>
>> &nbsp;package/Config.in&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
>> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 1
>> +<br>
>> &nbsp;package/python-psycopg2/<wbr>Config.in&nbsp; &nbsp; &nbsp;
>> &nbsp; &nbsp; &nbsp; | 22 ++++++++++++++++++++++<br>
>> &nbsp;package/python-psycopg2/<wbr>python-psycopg2.hash |&nbsp; 4 ++++<br>
>> &nbsp;package/python-psycopg2/<a href="http://python-psycopg2.mk"
>> data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-psycopg2.mk&amp;source=gmail&amp;ust=1520936994549000&amp;usg=AFQjCNFeItpacXzQMw7mFCro5y6_2TwVNg"
>> rel="noreferrer" target="_blank">python<wbr>-psycopg2.mk</a>&nbsp;
>> &nbsp;| 21 +++++++++++++++++++++<br>
>> &nbsp;5 files changed, 49 insertions(+)<br>
>> &nbsp;create mode 100644 package/python-psycopg2/<wbr>Config.in<br>
>> &nbsp;create mode 100644 package/python-psycopg2/<wbr>python-psycopg2.hash<br>
>> &nbsp;create mode 100644 package/python-psycopg2/<a
>> href="http://python-psycopg2.mk"
>> data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-psycopg2.mk&amp;source=gmail&amp;ust=1520936994550000&amp;usg=AFQjCNF6eQQgAZXDwH-sX_XlbMCbepnKvg"
>> rel="noreferrer" target="_blank">python<wbr>-psycopg2.mk</a><br>
>> <br>
>> diff --git a/DEVELOPERS b/DEVELOPERS<br>
>> index 3df820e712..6329bcde2d 100644<br>
>> --- a/DEVELOPERS<br>
>> +++ b/DEVELOPERS<br>
>> @@ -53,6 +53,7 @@ F:&nbsp; &nbsp; package/nginx-naxsi/<br>
>> &nbsp;F:&nbsp; &nbsp; &nbsp;package/policycoreutils/<br>
>> &nbsp;F:&nbsp; &nbsp; &nbsp;package/python-flask-<wbr>sqlalchemy/<br>
>> &nbsp;F:&nbsp; &nbsp; &nbsp;package/python-mutagen/<br>
>> +F:&nbsp; &nbsp; &nbsp;package/python-psycopg2/<br>
>> &nbsp;F:&nbsp; &nbsp; &nbsp;package/python-sqlalchemy/<br>
>> &nbsp;F:&nbsp; &nbsp; &nbsp;package/restorecond/<br>
>> &nbsp;F:&nbsp; &nbsp; &nbsp;package/refpolicy/<br>
>> diff --git a/package/Config.in b/package/Config.in<br>
>> index 449ffcc47b..d40170ccf9 100644<br>
>> --- a/package/Config.in<br>
>> +++ b/package/Config.in<br>
>> @@ -856,6 +856,7 @@ menu "External python modules"<br>
>> &nbsp; &nbsp; &nbsp; &nbsp; source
>> "package/python-prompt-<wbr>toolkit/Config.in"<br>
>> &nbsp; &nbsp; &nbsp; &nbsp; source "package/python-protobuf/<wbr>Config.in"<br>
>> &nbsp; &nbsp; &nbsp; &nbsp; source "package/python-psutil/Config.<wbr>in"<br>
>> +&nbsp; &nbsp; &nbsp; &nbsp;source "package/python-psycopg2/<wbr>Config.in"<br>
>> &nbsp; &nbsp; &nbsp; &nbsp; source
>> "package/python-ptyprocess/<wbr>Config.in"<br>
>> &nbsp; &nbsp; &nbsp; &nbsp; source "package/python-pudb/Config.<wbr>in"<br>
>> &nbsp; &nbsp; &nbsp; &nbsp; source "package/python-pyasn/Config.<wbr>in"<br>
>> diff --git a/package/python-psycopg2/<wbr>Config.in
>> b/package/python-psycopg2/<wbr>Config.in<br>
>> new file mode 100644<br>
>> index 0000000000..ec852bb49e<br>
>> --- /dev/null<br>
>> +++ b/package/python-psycopg2/<wbr>Config.in<br>
>> @@ -0,0 +1,22 @@<br>
>> +config BR2_PACKAGE_PYTHON_PSYCOPG2<br>
>> +&nbsp; &nbsp; &nbsp; &nbsp;bool "python-psycopg2"<br>
>> +&nbsp; &nbsp; &nbsp; &nbsp;select BR2_PACKAGE_POSTGRESQL<br>
>> +&nbsp; &nbsp; &nbsp; &nbsp;help<br>
>> +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Psycopg is the most popular
>> PostgreSQL database adapter for<br>
>> +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;the Python programming language.
>> Its main features are the<br>
>> +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;complete implementation of the
>> Python DB API 2.0 specification<br>
>> +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;and the thread safety (several
>> threads can share the same<br>
>> +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;connection). It was designed for
>> heavily multi-threaded<br>
>> +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;applications that create and
>> destroy lots of cursors and make<br>
>> +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;a large number of concurrent
>> INSERTs or UPDATEs.<br>
>> +<br>
>> +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Psycopg 2 is mostly implemented in
>> C as a libpq wrapper,<br>
>> +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;resulting in being both efficient
>> and secure. It features<br>
>> +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;client-side and server-side
>> cursors, asynchronous<br>
>> +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;communication and notifications,
>> COPY support. Many Python<br>
>> +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;types are supported out-of-the-box
>> and adapted to matching<br>
>> +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;PostgreSQL data types; adaptation
>> can be extended and<br>
>> +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;customized thanks to a flexible
>> objects adaptation system.<br>
>> +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Psycopg 2 is both Unicode and
>> Python 3 friendly.<br>
>> +<br>
>> +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a href="http://initd.org/psycopg/"
>> data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://initd.org/psycopg/&amp;source=gmail&amp;ust=1520936994550000&amp;usg=AFQjCNExcJs6P0RwG9xs65ktEQKMNYO-Lw"
>> rel="noreferrer" target="_blank">http://initd.org/psycopg/</a><br>
>> diff --git a/package/python-psycopg2/<wbr>python-psycopg2.hash
>> b/package/python-psycopg2/<wbr>python-psycopg2.hash<br>
>> new file mode 100644<br>
>> index 0000000000..ea4a07697b<br>
>> --- /dev/null<br>
>> +++ b/package/python-psycopg2/<wbr>python-psycopg2.hash<br>
>> @@ -0,0 +1,4 @@<br>
>> +# md5 from <a href="https://pypi.python.org/pypi/psycopg2/json"
>> data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://pypi.python.org/pypi/psycopg2/json&amp;source=gmail&amp;ust=1520936994551000&amp;usg=AFQjCNFBZ2ZGn1_7vjNz1EICtNJfxppeiQ"
>> rel="noreferrer"
>> target="_blank">https://pypi.python.org/pypi/<wbr>psycopg2/json</a>,
>> sha256 locally computed<br>
>> +md5&nbsp; &nbsp; 70fc57072e084565a42689d416cf2c<wbr>5c&nbsp;
>> psycopg2-2.7.4.tar.gz<br>
>> +sha256 8bf51191d60f6987482ef0cfe8511b<wbr>bf4877a5aa7f313d7b488b53189cf2<wbr>6209&nbsp;
>> psycopg2-2.7.4.tar.gz<br>
>> +sha256 1752db3c786e12b62ca804178dca03<wbr>3adce8bff4c4b3d98d3449d407fe45<wbr>210d&nbsp;
>> LICENSE<br>
>> diff --git a/package/python-psycopg2/<a
>> href="http://python-psycopg2.mk"
>> data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-psycopg2.mk&amp;source=gmail&amp;ust=1520936994551000&amp;usg=AFQjCNGAOhS0vQFFkraTzmuC1DNlw846lQ"
>> rel="noreferrer" target="_blank">pyth<wbr>on-psycopg2.mk</a>
>> b/package/python-psycopg2/<a href="http://python-psycopg2.mk"
>> data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-psycopg2.mk&amp;source=gmail&amp;ust=1520936994551000&amp;usg=AFQjCNGAOhS0vQFFkraTzmuC1DNlw846lQ"
>> rel="noreferrer" target="_blank">pyth<wbr>on-psycopg2.mk</a><br>
>> new file mode 100644<br>
>> index 0000000000..3cb8c85778<br>
>> --- /dev/null<br>
>> +++ b/package/python-psycopg2/<a href="http://python-psycopg2.mk"
>> data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-psycopg2.mk&amp;source=gmail&amp;ust=1520936994551000&amp;usg=AFQjCNGAOhS0vQFFkraTzmuC1DNlw846lQ"
>> rel="noreferrer" target="_blank">pyth<wbr>on-psycopg2.mk</a><br>
>> @@ -0,0 +1,21 @@<br>
>> +#############################<wbr>##############################<wbr>#####################<br>
>> +#<br>
>> +# python-psycopg2<br>
>> +#<br>
>> +#############################<wbr>##############################<wbr>#####################<br>
>> +<br>
>> +PYTHON_PSYCOPG2_VERSION = 2.7.4<br>
>> +PYTHON_PSYCOPG2_SOURCE = psycopg2-$(PYTHON_PSYCOPG2_<wbr>VERSION).tar.gz<br>
>> +PYTHON_PSYCOPG2_SITE = <a
>> href="https://pypi.python.org/packages/74/83/51580322ed0e82cba7ad8e0af590b8fb2cf11bd5aaa1ed872661bd36f462&#10;+PYTHON_PSYCOPG2_SETUP_TYPE"
>> data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://pypi.python.org/packages/74/83/51580322ed0e82cba7ad8e0af590b8fb2cf11bd5aaa1ed872661bd36f462%0A%2BPYTHON_PSYCOPG2_SETUP_TYPE&amp;source=gmail&amp;ust=1520936994552000&amp;usg=AFQjCNF85R-cL8pLEMOaqL4RdeoG_-P9tw"
>> rel="noreferrer"
>> target="_blank">https://pypi.python.org/<wbr>packages/74/83/<wbr>51580322ed0e82cba7ad8e0af590b8<wbr>fb2cf11bd5aaa1ed872661bd36f462<br>
>> +PYTHON_PSYCOPG2_SETUP_TYPE</a> = setuptools<br>
>> +PYTHON_PSYCOPG2_LICENSE = LGPL-3.0+<br>
>> +PYTHON_PSYCOPG2_LICENSE_FILES = LICENSE<br>
>> +PYTHON_PSYCOPG2_DEPENDENCIES = postgresql<br>
>> +<br>
>> +# Force psycopg2 to use the BuildRoot provided postgresql version
>> instead of<br>
>> +# The host machines<br>
>> +PYTHON_PSYCOPG2_BUILD_OPTS += build_ext
>> --pg-config=$(STAGING_DIR)/<wbr>usr/bin/pg_config<br>
>> +<br>
>> +PYTHON_PSYCOPG2_INSTALL_<wbr>TARGET_OPTS += build_ext
>> --pg-config=$(STAGING_DIR)/<wbr>usr/bin/pg_config<br>
>> +<br>
>> +$(eval $(python-package))<br>
>> <span class="HOEnZb"><font color="#888888">--<br>
>> 2.14.3<br>
>> <br>
>> ______________________________<wbr>_________________<br>
>> buildroot mailing list<br>
>> <a href="mailto:buildroot@busybox.net">buildroot at busybox.net</a><br>
>> <a href="http://lists.busybox.net/mailman/listinfo/buildroot"
>> data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://lists.busybox.net/mailman/listinfo/buildroot&amp;source=gmail&amp;ust=1520936994553000&amp;usg=AFQjCNF0g03-hvo6DFfcvbxl6t7ldPQ_JA"
>> rel="noreferrer"
>> target="_blank">http://lists.busybox.net/<wbr>mailman/listinfo/buildroot</a><br>
>> </font></span></blockquote></div><br></div>
<div class="gmail_extra"><br><div class="gmail_quote">On Mon, Mar 12,
2018 at 12:26 PM, Adam Duskett <span dir="ltr">&lt;<a
href="mailto:aduskett@gmail.com"
target="_blank">aduskett at gmail.com</a>&gt;</span>
wrote:<br><blockquote class="gmail_quote" style="margin:0 0 0
.8ex;border-left:1px #ccc solid;padding-left:1ex">Hey Yegor;<br>
<div><div class="h5"><br>
On Mon, Mar 12, 2018 at 6:34 AM, Yegor Yefremov<br>
&lt;<a href="mailto:yegorslists@googlemail.com">yegorslists at googlemail.com</a>&gt;
wrote:<br>
&gt; On Mon, Mar 12, 2018 at 11:12 AM, Adam Duskett &lt;<a
href="mailto:aduskett@gmail.com">aduskett at gmail.com</a>&gt; wrote:<br>
&gt;&gt; Psycopg is the most popular PostgreSQL database adapter for
the Python<br>
&gt;&gt; programming language. Its main features are the complete
implementation of the<br>
&gt;&gt; Python DB API 2.0 specification and the thread safety
(several threads can<br>
&gt;&gt; share the same connection). It was designed for heavily
multi-threaded<br>
&gt;&gt; applications that create and destroy lots of cursors and make
a large number of<br>
&gt;&gt; concurrent INSERTs or UPDATEs.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Adam Duskett &lt;<a
href="mailto:aduskett@gmail.com">aduskett at gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; Changes v1 -&gt; v2:<br>
&gt;&gt;&nbsp; &nbsp;- None<br>
&gt;&gt;<br>
&gt;&gt; Changes v2 -&gt; v3:<br>
&gt;&gt;&nbsp; &nbsp;- Removed
python-psycopg2/0001-don-t-<wbr>use-pg_config.patch<br>
&gt;&gt;&nbsp; &nbsp;- Added PYTHON_PSYCOPG2_BUILD_OPTS and
PYTHON_PSYCOPG2_INSTALL_<wbr>TARGET_OPTS<br>
&gt;&gt;&nbsp; &nbsp; &nbsp;to point towards Buildroots own pg_config
file. (Thomas)<br>
&gt;&gt;&nbsp; &nbsp;- Updated to 2.7.4<br>
&gt;&gt;<br>
&gt;&gt;&nbsp; DEVELOPERS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;|&nbsp; 1 +<br>
&gt;&gt;&nbsp; package/Config.in&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp;
1 +<br>
&gt;&gt;&nbsp; package/python-psycopg2/<wbr>Config.in&nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; | 22 ++++++++++++++++++++++<br>
&gt;&gt;&nbsp; package/python-psycopg2/<wbr>python-psycopg2.hash
|&nbsp; 4 ++++<br>
&gt;&gt;&nbsp; package/python-psycopg2/<a
href="http://python-psycopg2.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-psycopg2.mk&amp;source=gmail&amp;ust=1520944640732000&amp;usg=AFQjCNEgP8pIR26DFhM6VnwoURjWTLsPVw"
rel="noreferrer" target="_blank">python<wbr>-psycopg2.mk</a>&nbsp;
&nbsp;| 21 +++++++++++++++++++++<br>
&gt;&gt;&nbsp; 5 files changed, 49 insertions(+)<br>
&gt;&gt;&nbsp; create mode 100644 package/python-psycopg2/<wbr>Config.in<br>
&gt;&gt;&nbsp; create mode 100644
package/python-psycopg2/<wbr>python-psycopg2.hash<br>
&gt;&gt;&nbsp; create mode 100644 package/python-psycopg2/<a
href="http://python-psycopg2.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-psycopg2.mk&amp;source=gmail&amp;ust=1520944640733000&amp;usg=AFQjCNFWR_z5FmlmrCG_JwL1MdPItsNoIA"
rel="noreferrer" target="_blank">python<wbr>-psycopg2.mk</a><br>
&gt;&gt;<br>
&gt;&gt; diff --git a/DEVELOPERS b/DEVELOPERS<br>
&gt;&gt; index 3df820e712..6329bcde2d 100644<br>
&gt;&gt; --- a/DEVELOPERS<br>
&gt;&gt; +++ b/DEVELOPERS<br>
&gt;&gt; @@ -53,6 +53,7 @@ F:&nbsp; &nbsp; package/nginx-naxsi/<br>
&gt;&gt;&nbsp; F:&nbsp; &nbsp; &nbsp;package/policycoreutils/<br>
&gt;&gt;&nbsp; F:&nbsp; &nbsp; &nbsp;package/python-flask-<wbr>sqlalchemy/<br>
&gt;&gt;&nbsp; F:&nbsp; &nbsp; &nbsp;package/python-mutagen/<br>
&gt;&gt; +F:&nbsp; &nbsp; &nbsp;package/python-psycopg2/<br>
&gt;&gt;&nbsp; F:&nbsp; &nbsp; &nbsp;package/python-sqlalchemy/<br>
&gt;&gt;&nbsp; F:&nbsp; &nbsp; &nbsp;package/restorecond/<br>
&gt;&gt;&nbsp; F:&nbsp; &nbsp; &nbsp;package/refpolicy/<br>
&gt;&gt; diff --git a/package/Config.in b/package/Config.in<br>
&gt;&gt; index 449ffcc47b..d40170ccf9 100644<br>
&gt;&gt; --- a/package/Config.in<br>
&gt;&gt; +++ b/package/Config.in<br>
&gt;&gt; @@ -856,6 +856,7 @@ menu "External python modules"<br>
&gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;source
"package/python-prompt-<wbr>toolkit/Config.in"<br>
&gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;source
"package/python-protobuf/<wbr>Config.in"<br>
&gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;source
"package/python-psutil/Config.<wbr>in"<br>
&gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp;source
"package/python-psycopg2/<wbr>Config.in"<br>
&gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;source
"package/python-ptyprocess/<wbr>Config.in"<br>
&gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;source
"package/python-pudb/Config.<wbr>in"<br>
&gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;source
"package/python-pyasn/Config.<wbr>in"<br>
&gt;&gt; diff --git a/package/python-psycopg2/<wbr>Config.in
b/package/python-psycopg2/<wbr>Config.in<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..ec852bb49e<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/package/python-psycopg2/<wbr>Config.in<br>
&gt;&gt; @@ -0,0 +1,22 @@<br>
&gt;&gt; +config BR2_PACKAGE_PYTHON_PSYCOPG2<br>
&gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp;bool "python-psycopg2"<br>
&gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp;select BR2_PACKAGE_POSTGRESQL<br>
&gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp;help<br>
&gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Psycopg is the most
popular PostgreSQL database adapter for<br>
&gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;the Python programming
language. Its main features are the<br>
&gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;complete implementation of
the Python DB API 2.0 specification<br>
&gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;and the thread safety
(several threads can share the same<br>
&gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;connection). It was
designed for heavily multi-threaded<br>
&gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;applications that create
and destroy lots of cursors and make<br>
&gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;a large number of
concurrent INSERTs or UPDATEs.<br>
&gt;&gt; +<br>
&gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Psycopg 2 is mostly
implemented in C as a libpq wrapper,<br>
&gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;resulting in being both
efficient and secure. It features<br>
&gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;client-side and
server-side cursors, asynchronous<br>
&gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;communication and
notifications, COPY support. Many Python<br>
&gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;types are supported
out-of-the-box and adapted to matching<br>
&gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;PostgreSQL data types;
adaptation can be extended and<br>
&gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;customized thanks to a
flexible objects adaptation system.<br>
&gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Psycopg 2 is both Unicode
and Python 3 friendly.<br>
&gt;&gt; +<br>
&gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a
href="http://initd.org/psycopg/"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://initd.org/psycopg/&amp;source=gmail&amp;ust=1520944640734000&amp;usg=AFQjCNFzqDDI3Nhhz7RFsdGOmD06X-qdCA"
rel="noreferrer" target="_blank">http://initd.org/psycopg/</a><br>
&gt;<br>
&gt; Postgresql deps are missing:<br>
&gt;<br>
&gt; comment "postgresql needs a toolchain w/ dynamic library"<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;depends on BR2_STATIC_LIBS<br>
&gt;<br>
&gt; With these changes applied you can add my<br>
&gt;<br>
&gt; Reviewed-by: Yegor Yefremov &lt;<a
href="mailto:yegorslists@googlemail.com">yegorslists at googlemail.com</a>&gt;<br>
&gt;<br>
&gt; Yegor<br>
&gt;<br>
</div></div>This isn't necessary is it? psycopg2 can't be selected unless<br>
python2/3 is selected, and those<br>
require a dynamic library.<br>
<span class="HOEnZb"><font color="#888888"><br>
Adam<br>
</font></span><div class="HOEnZb"><div class="h5"><br>
&gt;&gt; diff --git
a/package/python-psycopg2/<wbr>python-psycopg2.hash
b/package/python-psycopg2/<wbr>python-psycopg2.hash<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..ea4a07697b<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/package/python-psycopg2/<wbr>python-psycopg2.hash<br>
&gt;&gt; @@ -0,0 +1,4 @@<br>
&gt;&gt; +# md5 from <a
href="https://pypi.python.org/pypi/psycopg2/json"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://pypi.python.org/pypi/psycopg2/json&amp;source=gmail&amp;ust=1520944640735000&amp;usg=AFQjCNGFld7Xojdxedc8g_AMjsAzw9WmcQ"
rel="noreferrer"
target="_blank">https://pypi.python.org/pypi/<wbr>psycopg2/json</a>,
sha256 locally computed<br>
&gt;&gt; +md5&nbsp; &nbsp; 70fc57072e084565a42689d416cf2c<wbr>5c&nbsp;
psycopg2-2.7.4.tar.gz<br>
&gt;&gt; +sha256
8bf51191d60f6987482ef0cfe8511b<wbr>bf4877a5aa7f313d7b488b53189cf2<wbr>6209&nbsp;
psycopg2-2.7.4.tar.gz<br>
&gt;&gt; +sha256
1752db3c786e12b62ca804178dca03<wbr>3adce8bff4c4b3d98d3449d407fe45<wbr>210d&nbsp;
LICENSE<br>
&gt;&gt; diff --git a/package/python-psycopg2/<a
href="http://python-psycopg2.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-psycopg2.mk&amp;source=gmail&amp;ust=1520944640735000&amp;usg=AFQjCNEn4GxgU6TSBa9yjyUYUcbIvj2HtA"
rel="noreferrer" target="_blank">pyth<wbr>on-psycopg2.mk</a>
b/package/python-psycopg2/<a href="http://python-psycopg2.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-psycopg2.mk&amp;source=gmail&amp;ust=1520944640735000&amp;usg=AFQjCNEn4GxgU6TSBa9yjyUYUcbIvj2HtA"
rel="noreferrer" target="_blank">pyth<wbr>on-psycopg2.mk</a><br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..3cb8c85778<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/package/python-psycopg2/<a
href="http://python-psycopg2.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-psycopg2.mk&amp;source=gmail&amp;ust=1520944640735000&amp;usg=AFQjCNEn4GxgU6TSBa9yjyUYUcbIvj2HtA"
rel="noreferrer" target="_blank">pyth<wbr>on-psycopg2.mk</a><br>
&gt;&gt; @@ -0,0 +1,21 @@<br>
&gt;&gt; +#############################<wbr>##############################<wbr>#####################<br>
&gt;&gt; +#<br>
&gt;&gt; +# python-psycopg2<br>
&gt;&gt; +#<br>
&gt;&gt; +#############################<wbr>##############################<wbr>#####################<br>
&gt;&gt; +<br>
&gt;&gt; +PYTHON_PSYCOPG2_VERSION = 2.7.4<br>
&gt;&gt; +PYTHON_PSYCOPG2_SOURCE =
psycopg2-$(PYTHON_PSYCOPG2_<wbr>VERSION).tar.gz<br>
&gt;&gt; +PYTHON_PSYCOPG2_SITE = <a
href="https://pypi.python.org/packages/74/83/51580322ed0e82cba7ad8e0af590b8fb2cf11bd5aaa1ed872661bd36f462"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://pypi.python.org/packages/74/83/51580322ed0e82cba7ad8e0af590b8fb2cf11bd5aaa1ed872661bd36f462&amp;source=gmail&amp;ust=1520944640736000&amp;usg=AFQjCNFLMzp_GAdJ9gltSmoDCJacm4jJFg"
rel="noreferrer"
target="_blank">https://pypi.python.org/<wbr>packages/74/83/<wbr>51580322ed0e82cba7ad8e0af590b8<wbr>fb2cf11bd5aaa1ed872661bd36f462</a><br>
&gt;&gt; +PYTHON_PSYCOPG2_SETUP_TYPE = setuptools<br>
&gt;&gt; +PYTHON_PSYCOPG2_LICENSE = LGPL-3.0+<br>
&gt;&gt; +PYTHON_PSYCOPG2_LICENSE_FILES = LICENSE<br>
&gt;&gt; +PYTHON_PSYCOPG2_DEPENDENCIES = postgresql<br>
&gt;&gt; +<br>
&gt;&gt; +# Force psycopg2 to use the BuildRoot provided postgresql
version instead of<br>
&gt;&gt; +# The host machines<br>
&gt;&gt; +PYTHON_PSYCOPG2_BUILD_OPTS += build_ext
--pg-config=$(STAGING_DIR)/<wbr>usr/bin/pg_config<br>
&gt;&gt; +<br>
&gt;&gt; +PYTHON_PSYCOPG2_INSTALL_<wbr>TARGET_OPTS += build_ext
--pg-config=$(STAGING_DIR)/<wbr>usr/bin/pg_config<br>
&gt;&gt; +<br>
&gt;&gt; +$(eval $(python-package))<br>
&gt;&gt; --<br>
&gt;&gt; 2.14.3<br>
&gt;&gt;<br>
&gt;&gt; ______________________________<wbr>_________________<br>
&gt;&gt; buildroot mailing list<br>
&gt;&gt; <a href="mailto:buildroot@busybox.net">buildroot at busybox.net</a><br>
&gt;&gt; <a href="http://lists.busybox.net/mailman/listinfo/buildroot"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://lists.busybox.net/mailman/listinfo/buildroot&amp;source=gmail&amp;ust=1520944640736000&amp;usg=AFQjCNHYL3U_302pR3yaNNQswMpzXZPZHA"
rel="noreferrer"
target="_blank">http://lists.busybox.net/<wbr>mailman/listinfo/buildroot</a>&lt;div
class="gmail_extra"&gt;&lt;br&gt;&lt;div class="gmail_quote"&gt;On
Mon, Mar 12, 2018 at 11:12 AM, Adam Duskett &lt;span
dir="ltr"&gt;&amp;lt;&lt;a href="mailto:<a
href="mailto:aduskett@gmail.com">aduskett at gmail.<wbr>com</a>"
target="_blank"&gt;<a
href="mailto:aduskett@gmail.com">aduskett@<wbr>gmail.com</a>&lt;/a&gt;&amp;gt;&lt;/span&gt;
wrote:&lt;br&gt;&lt;blockquote class="gmail_quote" style="margin:0 0 0
.8ex;border-left:1px #ccc solid;padding-left:1ex"&gt;<wbr>Psycopg is
the most popular PostgreSQL database adapter for the
Python&lt;br&gt;<br>
&gt; programming language. Its main features are the complete<br>
&gt; implementation of the&lt;br&gt;<br>
&gt; Python DB API 2.0 specification and the thread safety (several
threads can&lt;br&gt;<br>
&gt; share the same connection). It was designed for heavily
multi-threaded&lt;br&gt;<br>
&gt; applications that create and destroy lots of cursors and make a large<br>
&gt; number of&lt;br&gt;<br>
&gt; concurrent INSERTs or UPDATEs.&lt;br&gt;<br>
&gt; &lt;br&gt;<br>
&gt; Signed-off-by: Adam Duskett &amp;lt;&lt;a<br>
&gt; href="mailto:<a
href="mailto:aduskett@gmail.com">aduskett at gmail.<wbr>com</a>"&gt;<a
href="mailto:aduskett@gmail.com">aduskett at gmail.com</a>&lt;/a&gt;&amp;<wbr>gt;&lt;br&gt;<br>
&gt; ---&lt;br&gt;<br>
&gt; Changes v1 -&amp;gt; v2:&lt;br&gt;<br>
&gt; &amp;nbsp; - None&lt;br&gt;<br>
&gt; &lt;br&gt;<br>
&gt; Changes v2 -&amp;gt; v3:&lt;br&gt;<br>
&gt; &amp;nbsp; - Removed
python-psycopg2/0001-don-t-&lt;<wbr>wbr&gt;use-pg_config.patch&lt;br&gt;<br>
&gt; &amp;nbsp; - Added PYTHON_PSYCOPG2_BUILD_OPTS and<br>
&gt; PYTHON_PSYCOPG2_INSTALL_&lt;wbr&gt;<wbr>TARGET_OPTS&lt;br&gt;<br>
&gt; &amp;nbsp; &amp;nbsp; to point towards Buildroots own pg_config
file. (Thomas)&lt;br&gt;<br>
&gt; &amp;nbsp; - Updated to 2.7.4&lt;br&gt;<br>
&gt; &lt;br&gt;<br>
&gt; &amp;nbsp;DEVELOPERS&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;
&amp;nbsp; &amp;nbsp; &amp;nbsp;<br>
&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;
&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;<br>
&gt; &amp;nbsp;|&amp;nbsp; 1 +&lt;br&gt;<br>
&gt; &amp;nbsp;package/Config.in&amp;nbsp; &amp;nbsp; &amp;nbsp;
&amp;nbsp; &amp;nbsp; &amp;nbsp;<br>
&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;
&amp;nbsp; &amp;nbsp; |&amp;nbsp; 1<br>
&gt; +&lt;br&gt;<br>
&gt; &amp;nbsp;package/python-psycopg2/<wbr>&lt;wbr&gt;Config.in&amp;nbsp;
&amp;nbsp; &amp;nbsp;<br>
&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; | 22 ++++++++++++++++++++++&lt;br&gt;<br>
&gt; &amp;nbsp;package/python-psycopg2/<wbr>&lt;wbr&gt;python-psycopg2.hash
|&amp;nbsp; 4 ++++&lt;br&gt;<br>
&gt; &amp;nbsp;package/python-psycopg2/<wbr>&lt;a href="<a
href="http://python-psycopg2.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-psycopg2.mk&amp;source=gmail&amp;ust=1520944640738000&amp;usg=AFQjCNFl6wCMoNbgP3GmElMlTQObBnI7HQ"
rel="noreferrer"
target="_blank">http://python-psycopg2.<wbr>mk</a>"<br>
&gt; data-saferedirecturl="<a
href="https://www.google.com/url?hl=en&amp;amp;q=http://python-psycopg2.mk&amp;amp;source=gmail&amp;amp;ust=1520936994549000&amp;amp;usg=AFQjCNFeItpacXzQMw7mFCro5y6_2TwVNg"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://www.google.com/url?hl%3Den%26amp;q%3Dhttp://python-psycopg2.mk%26amp;source%3Dgmail%26amp;ust%3D1520936994549000%26amp;usg%3DAFQjCNFeItpacXzQMw7mFCro5y6_2TwVNg&amp;source=gmail&amp;ust=1520944640738000&amp;usg=AFQjCNHfS5YzY0vUdFZQ6eSqg9YaqhxR7g"
rel="noreferrer"
target="_blank">https://<wbr>www.google.com/url?hl=en&amp;amp;<wbr>q=http://python-psycopg2.mk&amp;<wbr>amp;source=gmail&amp;amp;ust=<wbr>1520936994549000&amp;amp;usg=<wbr>AFQjCNFeItpacXzQMw7mFCro5y6_<wbr>2TwVNg</a>"<br>
&gt; rel="noreferrer" target="_blank"&gt;python&lt;wbr&gt;-<a
href="http://psycopg2.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://psycopg2.mk&amp;source=gmail&amp;ust=1520944640738000&amp;usg=AFQjCNGMnpSYeD53tuDbZK-wNeDkLrs5AQ"
rel="noreferrer"
target="_blank">ps<wbr>ycopg2.mk</a>&lt;/a&gt;&amp;nbsp;<br>
&gt; &amp;nbsp;| 21 +++++++++++++++++++++&lt;br&gt;<br>
&gt; &amp;nbsp;5 files changed, 49 insertions(+)&lt;br&gt;<br>
&gt; &amp;nbsp;create mode 100644
package/python-psycopg2/&lt;wbr&gt;<wbr>Config.in&lt;br&gt;<br>
&gt; &amp;nbsp;create mode 100644
package/python-psycopg2/&lt;wbr&gt;<wbr>python-psycopg2.hash&lt;br&gt;<br>
&gt; &amp;nbsp;create mode 100644 package/python-psycopg2/&lt;a<br>
&gt; href="<a href="http://python-psycopg2.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-psycopg2.mk&amp;source=gmail&amp;ust=1520944640739000&amp;usg=AFQjCNEnyFYKr1-FUBYgzg1Em-hQUQF6CA"
rel="noreferrer"
target="_blank">http://python-psycopg2.<wbr>mk</a>"<br>
&gt; data-saferedirecturl="<a
href="https://www.google.com/url?hl=en&amp;amp;q=http://python-psycopg2.mk&amp;amp;source=gmail&amp;amp;ust=1520936994550000&amp;amp;usg=AFQjCNF6eQQgAZXDwH-sX_XlbMCbepnKvg"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://www.google.com/url?hl%3Den%26amp;q%3Dhttp://python-psycopg2.mk%26amp;source%3Dgmail%26amp;ust%3D1520936994550000%26amp;usg%3DAFQjCNF6eQQgAZXDwH-sX_XlbMCbepnKvg&amp;source=gmail&amp;ust=1520944640739000&amp;usg=AFQjCNGS22h11Te3yBsCPjemtYwPpbK72w"
rel="noreferrer"
target="_blank">https://<wbr>www.google.com/url?hl=en&amp;amp;<wbr>q=http://python-psycopg2.mk&amp;<wbr>amp;source=gmail&amp;amp;ust=<wbr>1520936994550000&amp;amp;usg=<wbr>AFQjCNF6eQQgAZXDwH-sX_<wbr>XlbMCbepnKvg</a>"<br>
&gt; rel="noreferrer" target="_blank"&gt;python&lt;wbr&gt;-<a
href="http://psycopg2.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://psycopg2.mk&amp;source=gmail&amp;ust=1520944640739000&amp;usg=AFQjCNGSOfNn17d8YXSs2bAqTFVArZ0I8g"
rel="noreferrer"
target="_blank">ps<wbr>ycopg2.mk</a>&lt;/a&gt;&lt;br&gt;<br>
&gt; &lt;br&gt;<br>
&gt; diff --git a/DEVELOPERS b/DEVELOPERS&lt;br&gt;<br>
&gt; index 3df820e712..6329bcde2d 100644&lt;br&gt;<br>
&gt; --- a/DEVELOPERS&lt;br&gt;<br>
&gt; +++ b/DEVELOPERS&lt;br&gt;<br>
&gt; @@ -53,6 +53,7 @@ F:&amp;nbsp; &amp;nbsp;
package/nginx-naxsi/&lt;br&gt;<br>
&gt; &amp;nbsp;F:&amp;nbsp; &amp;nbsp;
&amp;nbsp;package/policycoreutils/<wbr>&lt;br&gt;<br>
&gt; &amp;nbsp;F:&amp;nbsp; &amp;nbsp;
&amp;nbsp;package/python-flask-&lt;<wbr>wbr&gt;sqlalchemy/&lt;br&gt;<br>
&gt; &amp;nbsp;F:&amp;nbsp; &amp;nbsp;
&amp;nbsp;package/python-mutagen/&lt;<wbr>br&gt;<br>
&gt; +F:&amp;nbsp; &amp;nbsp;
&amp;nbsp;package/python-psycopg2/<wbr>&lt;br&gt;<br>
&gt; &amp;nbsp;F:&amp;nbsp; &amp;nbsp;
&amp;nbsp;package/python-<wbr>sqlalchemy/&lt;br&gt;<br>
&gt; &amp;nbsp;F:&amp;nbsp; &amp;nbsp;
&amp;nbsp;package/restorecond/&lt;br&gt;<br>
&gt; &amp;nbsp;F:&amp;nbsp; &amp;nbsp;
&amp;nbsp;package/refpolicy/&lt;br&gt;<br>
&gt; diff --git a/package/Config.in b/package/Config.in&lt;br&gt;<br>
&gt; index 449ffcc47b..d40170ccf9 100644&lt;br&gt;<br>
&gt; --- a/package/Config.in&lt;br&gt;<br>
&gt; +++ b/package/Config.in&lt;br&gt;<br>
&gt; @@ -856,6 +856,7 @@ menu "External python modules"&lt;br&gt;<br>
&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; source<br>
&gt; "package/python-prompt-&lt;wbr&gt;<wbr>toolkit/Config.in"&lt;br&gt;<br>
&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; source
"package/python-protobuf/&lt;wbr&gt;<wbr>Config.in"&lt;br&gt;<br>
&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; source
"package/python-psutil/Config.<wbr>&lt;wbr&gt;in"&lt;br&gt;<br>
&gt; +&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;source
"package/python-psycopg2/&lt;wbr&gt;<wbr>Config.in"&lt;br&gt;<br>
&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; source<br>
&gt; "package/python-ptyprocess/&lt;<wbr>wbr&gt;Config.in"&lt;br&gt;<br>
&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; source
"package/python-pudb/Config.&lt;<wbr>wbr&gt;in"&lt;br&gt;<br>
&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; source
"package/python-pyasn/Config.&lt;<wbr>wbr&gt;in"&lt;br&gt;<br>
&gt; diff --git a/package/python-psycopg2/&lt;<wbr>wbr&gt;Config.in<br>
&gt; b/package/python-psycopg2/&lt;<wbr>wbr&gt;Config.in&lt;br&gt;<br>
&gt; new file mode 100644&lt;br&gt;<br>
&gt; index 0000000000..ec852bb49e&lt;br&gt;<br>
&gt; --- /dev/null&lt;br&gt;<br>
&gt; +++ b/package/python-psycopg2/&lt;<wbr>wbr&gt;Config.in&lt;br&gt;<br>
&gt; @@ -0,0 +1,22 @@&lt;br&gt;<br>
&gt; +config BR2_PACKAGE_PYTHON_PSYCOPG2&lt;<wbr>br&gt;<br>
&gt; +&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;bool
"python-psycopg2"&lt;br&gt;<br>
&gt; +&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;select
BR2_PACKAGE_POSTGRESQL&lt;br&gt;<br>
&gt; +&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;help&lt;br&gt;<br>
&gt; +&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;Psycopg is
the most popular<br>
&gt; PostgreSQL database adapter for&lt;br&gt;<br>
&gt; +&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;the Python
programming language.<br>
&gt; Its main features are the&lt;br&gt;<br>
&gt; +&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;complete
implementation of the<br>
&gt; Python DB API 2.0 specification&lt;br&gt;<br>
&gt; +&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;and the
thread safety (several<br>
&gt; threads can share the same&lt;br&gt;<br>
&gt; +&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;
&amp;nbsp;connection). It was designed for<br>
&gt; heavily multi-threaded&lt;br&gt;<br>
&gt; +&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;
&amp;nbsp;applications that create and<br>
&gt; destroy lots of cursors and make&lt;br&gt;<br>
&gt; +&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;a large
number of concurrent<br>
&gt; INSERTs or UPDATEs.&lt;br&gt;<br>
&gt; +&lt;br&gt;<br>
&gt; +&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;Psycopg 2
is mostly implemented in<br>
&gt; C as a libpq wrapper,&lt;br&gt;<br>
&gt; +&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;resulting
in being both efficient<br>
&gt; and secure. It features&lt;br&gt;<br>
&gt; +&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;
&amp;nbsp;client-side and server-side<br>
&gt; cursors, asynchronous&lt;br&gt;<br>
&gt; +&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;
&amp;nbsp;communication and notifications,<br>
&gt; COPY support. Many Python&lt;br&gt;<br>
&gt; +&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;types are
supported out-of-the-box<br>
&gt; and adapted to matching&lt;br&gt;<br>
&gt; +&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;PostgreSQL
data types; adaptation<br>
&gt; can be extended and&lt;br&gt;<br>
&gt; +&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;customized
thanks to a flexible<br>
&gt; objects adaptation system.&lt;br&gt;<br>
&gt; +&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;Psycopg 2
is both Unicode and<br>
&gt; Python 3 friendly.&lt;br&gt;<br>
&gt; +&lt;br&gt;<br>
&gt; +&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;a
href="<a href="http://initd.org/psycopg/"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://initd.org/psycopg/&amp;source=gmail&amp;ust=1520944640740000&amp;usg=AFQjCNEub0DMljKLJD4dcbYOvEh84jfhkQ"
rel="noreferrer"
target="_blank">http://initd.org/<wbr>psycopg/</a>"<br>
&gt; data-saferedirecturl="<a
href="https://www.google.com/url?hl=en&amp;amp;q=http://initd.org/psycopg/&amp;amp;source=gmail&amp;amp;ust=1520936994550000&amp;amp;usg=AFQjCNExcJs6P0RwG9xs65ktEQKMNYO-Lw"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://www.google.com/url?hl%3Den%26amp;q%3Dhttp://initd.org/psycopg/%26amp;source%3Dgmail%26amp;ust%3D1520936994550000%26amp;usg%3DAFQjCNExcJs6P0RwG9xs65ktEQKMNYO-Lw&amp;source=gmail&amp;ust=1520944640740000&amp;usg=AFQjCNFFypveeXDkA13wXMVfib6jh4QS9g"
rel="noreferrer"
target="_blank">https://<wbr>www.google.com/url?hl=en&amp;amp;<wbr>q=http://initd.org/psycopg/&amp;<wbr>amp;source=gmail&amp;amp;ust=<wbr>1520936994550000&amp;amp;usg=<wbr>AFQjCNExcJs6P0RwG9xs65ktEQKMNY<wbr>O-Lw</a>"<br>
&gt; rel="noreferrer" target="_blank"&gt;<a
href="http://initd.org/psycopg/"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://initd.org/psycopg/&amp;source=gmail&amp;ust=1520944640740000&amp;usg=AFQjCNEub0DMljKLJD4dcbYOvEh84jfhkQ"
rel="noreferrer"
target="_blank">http://initd.<wbr>org/psycopg/</a>&lt;/a&gt;&lt;br&gt;<br>
&gt; diff --git
a/package/python-psycopg2/&lt;<wbr>wbr&gt;python-psycopg2.hash<br>
&gt; b/package/python-psycopg2/&lt;<wbr>wbr&gt;python-psycopg2.hash&lt;br&gt;<br>
&gt; new file mode 100644&lt;br&gt;<br>
&gt; index 0000000000..ea4a07697b&lt;br&gt;<br>
&gt; --- /dev/null&lt;br&gt;<br>
&gt; +++ b/package/python-psycopg2/&lt;<wbr>wbr&gt;python-psycopg2.hash&lt;br&gt;<br>
&gt; @@ -0,0 +1,4 @@&lt;br&gt;<br>
&gt; +# md5 from &lt;a href="<a
href="https://pypi.python.org/pypi/psycopg2/json"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://pypi.python.org/pypi/psycopg2/json&amp;source=gmail&amp;ust=1520944640740000&amp;usg=AFQjCNGiA4z8UYt1wc73_2hjNrXbMpRFdQ"
rel="noreferrer"
target="_blank">https://pypi.python.org/<wbr>pypi/psycopg2/json</a>"<br>
&gt; data-saferedirecturl="<a
href="https://www.google.com/url?hl=en&amp;amp;q=https://pypi.python.org/pypi/psycopg2/json&amp;amp;source=gmail&amp;amp;ust=1520936994551000&amp;amp;usg=AFQjCNFBZ2ZGn1_7vjNz1EICtNJfxppeiQ"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://www.google.com/url?hl%3Den%26amp;q%3Dhttps://pypi.python.org/pypi/psycopg2/json%26amp;source%3Dgmail%26amp;ust%3D1520936994551000%26amp;usg%3DAFQjCNFBZ2ZGn1_7vjNz1EICtNJfxppeiQ&amp;source=gmail&amp;ust=1520944640741000&amp;usg=AFQjCNGMko7liHpaNmylhtwV1THoWrRt_Q"
rel="noreferrer"
target="_blank">https://<wbr>www.google.com/url?hl=en&amp;amp;<wbr>q=https://pypi.python.org/<wbr>pypi/psycopg2/json&amp;amp;source=<wbr>gmail&amp;amp;ust=<wbr>1520936994551000&amp;amp;usg=<wbr>AFQjCNFBZ2ZGn1_<wbr>7vjNz1EICtNJfxppeiQ</a>"<br>
&gt; rel="noreferrer"<br>
&gt; target="_blank"&gt;<a href="https://pypi.python.org/pypi/"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://pypi.python.org/pypi/&amp;source=gmail&amp;ust=1520944640741000&amp;usg=AFQjCNHmTgI_9Vz2Q-28n68oh-_YCkqILw"
rel="noreferrer"
target="_blank">https://pypi.<wbr>python.org/pypi/</a>&lt;wbr&gt;psycopg2/<wbr>json&lt;/a&gt;,<br>
&gt; sha256 locally computed&lt;br&gt;<br>
&gt; +md5&amp;nbsp; &amp;nbsp;
70fc57072e084565a42689d416cf2c<wbr>&lt;wbr&gt;5c&amp;nbsp;<br>
&gt; psycopg2-2.7.4.tar.gz&lt;br&gt;<br>
&gt; +sha256 8bf51191d60f6987482ef0cfe8511b<wbr>&lt;wbr&gt;<wbr>bf4877a5aa7f313d7b488b53189cf2<wbr>&lt;wbr&gt;6209&amp;nbsp;<br>
&gt; psycopg2-2.7.4.tar.gz&lt;br&gt;<br>
&gt; +sha256 1752db3c786e12b62ca804178dca03<wbr>&lt;wbr&gt;<wbr>3adce8bff4c4b3d98d3449d407fe45<wbr>&lt;wbr&gt;210d&amp;nbsp;<br>
&gt; LICENSE&lt;br&gt;<br>
&gt; diff --git a/package/python-psycopg2/&lt;a<br>
&gt; href="<a href="http://python-psycopg2.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-psycopg2.mk&amp;source=gmail&amp;ust=1520944640741000&amp;usg=AFQjCNFmzcB0PRvTH_kdd4kx_Wyrsuv01A"
rel="noreferrer"
target="_blank">http://python-psycopg2.<wbr>mk</a>"<br>
&gt; data-saferedirecturl="<a
href="https://www.google.com/url?hl=en&amp;amp;q=http://python-psycopg2.mk&amp;amp;source=gmail&amp;amp;ust=1520936994551000&amp;amp;usg=AFQjCNGAOhS0vQFFkraTzmuC1DNlw846lQ"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://www.google.com/url?hl%3Den%26amp;q%3Dhttp://python-psycopg2.mk%26amp;source%3Dgmail%26amp;ust%3D1520936994551000%26amp;usg%3DAFQjCNGAOhS0vQFFkraTzmuC1DNlw846lQ&amp;source=gmail&amp;ust=1520944640741000&amp;usg=AFQjCNH7tfPwMNnYvI_iOCBMmA2xo-OGUg"
rel="noreferrer"
target="_blank">https://<wbr>www.google.com/url?hl=en&amp;amp;<wbr>q=http://python-psycopg2.mk&amp;<wbr>amp;source=gmail&amp;amp;ust=<wbr>1520936994551000&amp;amp;usg=<wbr>AFQjCNGAOhS0vQFFkraTzmuC1DNlw8<wbr>46lQ</a>"<br>
&gt; rel="noreferrer" target="_blank"&gt;pyth&lt;wbr&gt;<a
href="http://on-psycopg2.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://on-psycopg2.mk&amp;source=gmail&amp;ust=1520944640741000&amp;usg=AFQjCNGQ0UKyNy8_c96IYv-MBW7zMUp-Kg"
rel="noreferrer" target="_blank">on-<wbr>psycopg2.mk</a>&lt;/a&gt;<br>
&gt; b/package/python-psycopg2/&lt;a href="<a
href="http://python-psycopg2.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-psycopg2.mk&amp;source=gmail&amp;ust=1520944640741000&amp;usg=AFQjCNFmzcB0PRvTH_kdd4kx_Wyrsuv01A"
rel="noreferrer"
target="_blank">http://python-psycopg2.<wbr>mk</a>"<br>
&gt; data-saferedirecturl="<a
href="https://www.google.com/url?hl=en&amp;amp;q=http://python-psycopg2.mk&amp;amp;source=gmail&amp;amp;ust=1520936994551000&amp;amp;usg=AFQjCNGAOhS0vQFFkraTzmuC1DNlw846lQ"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://www.google.com/url?hl%3Den%26amp;q%3Dhttp://python-psycopg2.mk%26amp;source%3Dgmail%26amp;ust%3D1520936994551000%26amp;usg%3DAFQjCNGAOhS0vQFFkraTzmuC1DNlw846lQ&amp;source=gmail&amp;ust=1520944640741000&amp;usg=AFQjCNH7tfPwMNnYvI_iOCBMmA2xo-OGUg"
rel="noreferrer"
target="_blank">https://<wbr>www.google.com/url?hl=en&amp;amp;<wbr>q=http://python-psycopg2.mk&amp;<wbr>amp;source=gmail&amp;amp;ust=<wbr>1520936994551000&amp;amp;usg=<wbr>AFQjCNGAOhS0vQFFkraTzmuC1DNlw8<wbr>46lQ</a>"<br>
&gt; rel="noreferrer" target="_blank"&gt;pyth&lt;wbr&gt;<a
href="http://on-psycopg2.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://on-psycopg2.mk&amp;source=gmail&amp;ust=1520944640741000&amp;usg=AFQjCNGQ0UKyNy8_c96IYv-MBW7zMUp-Kg"
rel="noreferrer"
target="_blank">on-<wbr>psycopg2.mk</a>&lt;/a&gt;&lt;br&gt;<br>
&gt; new file mode 100644&lt;br&gt;<br>
&gt; index 0000000000..3cb8c85778&lt;br&gt;<br>
&gt; --- /dev/null&lt;br&gt;<br>
&gt; +++ b/package/python-psycopg2/&lt;a href="<a
href="http://python-psycopg2.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-psycopg2.mk&amp;source=gmail&amp;ust=1520944640742000&amp;usg=AFQjCNFFa3G8nAm25yWV7Sf3GrbzmXqouA"
rel="noreferrer"
target="_blank">http://python-psycopg2.<wbr>mk</a>"<br>
&gt; data-saferedirecturl="<a
href="https://www.google.com/url?hl=en&amp;amp;q=http://python-psycopg2.mk&amp;amp;source=gmail&amp;amp;ust=1520936994551000&amp;amp;usg=AFQjCNGAOhS0vQFFkraTzmuC1DNlw846lQ"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://www.google.com/url?hl%3Den%26amp;q%3Dhttp://python-psycopg2.mk%26amp;source%3Dgmail%26amp;ust%3D1520936994551000%26amp;usg%3DAFQjCNGAOhS0vQFFkraTzmuC1DNlw846lQ&amp;source=gmail&amp;ust=1520944640742000&amp;usg=AFQjCNF4FpYHtNAZOcJaJIHDnDyo9WjGCw"
rel="noreferrer"
target="_blank">https://<wbr>www.google.com/url?hl=en&amp;amp;<wbr>q=http://python-psycopg2.mk&amp;<wbr>amp;source=gmail&amp;amp;ust=<wbr>1520936994551000&amp;amp;usg=<wbr>AFQjCNGAOhS0vQFFkraTzmuC1DNlw8<wbr>46lQ</a>"<br>
&gt; rel="noreferrer" target="_blank"&gt;pyth&lt;wbr&gt;<a
href="http://on-psycopg2.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://on-psycopg2.mk&amp;source=gmail&amp;ust=1520944640742000&amp;usg=AFQjCNFNjlSrhD4rLa8L42zaFRUbfv1vTQ"
rel="noreferrer"
target="_blank">on-<wbr>psycopg2.mk</a>&lt;/a&gt;&lt;br&gt;<br>
&gt; @@ -0,0 +1,21 @@&lt;br&gt;<br>
&gt; +#############################<wbr>&lt;wbr&gt;#########################<wbr>#####&lt;wbr&gt;####################<wbr>#&lt;br&gt;<br>
&gt; +#&lt;br&gt;<br>
&gt; +# python-psycopg2&lt;br&gt;<br>
&gt; +#&lt;br&gt;<br>
&gt; +#############################<wbr>&lt;wbr&gt;#########################<wbr>#####&lt;wbr&gt;####################<wbr>#&lt;br&gt;<br>
&gt; +&lt;br&gt;<br>
&gt; +PYTHON_PSYCOPG2_VERSION = 2.7.4&lt;br&gt;<br>
&gt; +PYTHON_PSYCOPG2_SOURCE =
psycopg2-$(PYTHON_PSYCOPG2_&lt;<wbr>wbr&gt;VERSION).tar.gz&lt;br&gt;<br>
&gt; +PYTHON_PSYCOPG2_SITE = &lt;a<br>
&gt; href="<a href="https://pypi.python.org/packages/74/83/51580322ed0e82cba7ad8e0af590b8fb2cf11bd5aaa1ed872661bd36f462&amp;#10;+PYTHON_PSYCOPG2_SETUP_TYPE"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://pypi.python.org/packages/74/83/51580322ed0e82cba7ad8e0af590b8fb2cf11bd5aaa1ed872661bd36f462%26%2310;%2BPYTHON_PSYCOPG2_SETUP_TYPE&amp;source=gmail&amp;ust=1520944640743000&amp;usg=AFQjCNF3UBfgZQ2JSBz82FWJ8g091K6iHg"
rel="noreferrer"
target="_blank">https://pypi.python.org/<wbr>packages/74/83/<wbr>51580322ed0e82cba7ad8e0af590b8<wbr>fb2cf11bd5aaa1ed872661bd36f462<wbr>&amp;#10;+PYTHON_PSYCOPG2_SETUP_<wbr>TYPE</a>"<br>
&gt; data-saferedirecturl="<a
href="https://www.google.com/url?hl=en&amp;amp;q=https://pypi.python.org/packages/74/83/51580322ed0e82cba7ad8e0af590b8fb2cf11bd5aaa1ed872661bd36f462%0A%2BPYTHON_PSYCOPG2_SETUP_TYPE&amp;amp;source=gmail&amp;amp;ust=1520936994552000&amp;amp;usg=AFQjCNF85R-cL8pLEMOaqL4RdeoG_-P9tw"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://www.google.com/url?hl%3Den%26amp;q%3Dhttps://pypi.python.org/packages/74/83/51580322ed0e82cba7ad8e0af590b8fb2cf11bd5aaa1ed872661bd36f462%250A%252BPYTHON_PSYCOPG2_SETUP_TYPE%26amp;source%3Dgmail%26amp;ust%3D1520936994552000%26amp;usg%3DAFQjCNF85R-cL8pLEMOaqL4RdeoG_-P9tw&amp;source=gmail&amp;ust=1520944640743000&amp;usg=AFQjCNG-pXzaYBXzN-gLNiXTs5cFKWY6hA"
rel="noreferrer"
target="_blank">https://<wbr>www.google.com/url?hl=en&amp;amp;<wbr>q=https://pypi.python.org/<wbr>packages/74/83/<wbr>51580322ed0e82cba7ad8e0af590b8<wbr>fb2cf11bd5aaa1ed872661bd36f462<wbr>%0A%2BPYTHON_PSYCOPG2_SETUP_<wbr>TYPE&amp;amp;source=gmail&amp;amp;ust=<wbr>1520936994552000&amp;amp;usg=<wbr>AFQjCNF85R-cL8pLEMOaqL4RdeoG_-<wbr>P9tw</a>"<br>
&gt; rel="noreferrer"<br>
&gt; target="_blank"&gt;<a href="https://pypi.python.org/"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://pypi.python.org/&amp;source=gmail&amp;ust=1520944640743000&amp;usg=AFQjCNEf_rn8vehrTXZIzljP7PTbzfwz9g"
rel="noreferrer"
target="_blank">https://pypi.<wbr>python.org/</a>&lt;wbr&gt;packages/74/<wbr>83/&lt;wbr&gt;<wbr>51580322ed0e82cba7ad8e0af590b8<wbr>&lt;wbr&gt;<wbr>fb2cf11bd5aaa1ed872661bd36f462<wbr>&lt;br&gt;<br>
&gt; +PYTHON_PSYCOPG2_SETUP_TYPE&lt;/<wbr>a&gt; = setuptools&lt;br&gt;<br>
&gt; +PYTHON_PSYCOPG2_LICENSE = LGPL-3.0+&lt;br&gt;<br>
&gt; +PYTHON_PSYCOPG2_LICENSE_FILES = LICENSE&lt;br&gt;<br>
&gt; +PYTHON_PSYCOPG2_DEPENDENCIES = postgresql&lt;br&gt;<br>
&gt; +&lt;br&gt;<br>
&gt; +# Force psycopg2 to use the BuildRoot provided postgresql version<br>
&gt; instead of&lt;br&gt;<br>
&gt; +# The host machines&lt;br&gt;<br>
&gt; +PYTHON_PSYCOPG2_BUILD_OPTS += build_ext<br>
&gt; --pg-config=$(STAGING_DIR)/&lt;<wbr>wbr&gt;usr/bin/pg_config&lt;br&gt;<br>
&gt; +&lt;br&gt;<br>
&gt; +PYTHON_PSYCOPG2_INSTALL_&lt;wbr&gt;<wbr>TARGET_OPTS += build_ext<br>
&gt; --pg-config=$(STAGING_DIR)/&lt;<wbr>wbr&gt;usr/bin/pg_config&lt;br&gt;<br>
&gt; +&lt;br&gt;<br>
&gt; +$(eval $(python-package))&lt;br&gt;<br>
&gt; &lt;span class="HOEnZb"&gt;&lt;font color="#888888"&gt;--&lt;br&gt;<br>
&gt; 2.14.3&lt;br&gt;<br>
&gt; &lt;br&gt;<br>
&gt; ______________________________<wbr>&lt;wbr&gt;_________________&lt;br&gt;<br>
&gt; buildroot mailing list&lt;br&gt;<br>
&gt; &lt;a href="mailto:<a
href="mailto:buildroot@busybox.net">buildroot@<wbr>busybox.net</a>"&gt;<a
href="mailto:buildroot@busybox.net">buildroot@<wbr>busybox.net</a>&lt;/a&gt;&lt;br&gt;<br>
&gt; &lt;a href="<a
href="http://lists.busybox.net/mailman/listinfo/buildroot"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://lists.busybox.net/mailman/listinfo/buildroot&amp;source=gmail&amp;ust=1520944640743000&amp;usg=AFQjCNHllS0kzWLKaKnhZIXA-y_MY7wUDw"
rel="noreferrer"
target="_blank">http://lists.busybox.<wbr>net/mailman/listinfo/buildroot</a><wbr>"<br>
&gt; data-saferedirecturl="<a
href="https://www.google.com/url?hl=en&amp;amp;q=http://lists.busybox.net/mailman/listinfo/buildroot&amp;amp;source=gmail&amp;amp;ust=1520936994553000&amp;amp;usg=AFQjCNF0g03-hvo6DFfcvbxl6t7ldPQ_JA"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://www.google.com/url?hl%3Den%26amp;q%3Dhttp://lists.busybox.net/mailman/listinfo/buildroot%26amp;source%3Dgmail%26amp;ust%3D1520936994553000%26amp;usg%3DAFQjCNF0g03-hvo6DFfcvbxl6t7ldPQ_JA&amp;source=gmail&amp;ust=1520944640744000&amp;usg=AFQjCNHrP36XBhKoLGX6ylsvQo8TsoDdPw"
rel="noreferrer"
target="_blank">https://<wbr>www.google.com/url?hl=en&amp;amp;<wbr>q=http://lists.busybox.net/<wbr>mailman/listinfo/buildroot&amp;<wbr>amp;source=gmail&amp;amp;ust=<wbr>1520936994553000&amp;amp;usg=<wbr>AFQjCNF0g03-<wbr>hvo6DFfcvbxl6t7ldPQ_JA</a>"<br>
&gt; rel="noreferrer"<br>
&gt; target="_blank"&gt;<a href="http://lists.busybox.net/"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://lists.busybox.net/&amp;source=gmail&amp;ust=1520944640744000&amp;usg=AFQjCNETJopGlxNrI9avzC5lOxnyZMC4VQ"
rel="noreferrer"
target="_blank">http://lists.<wbr>busybox.net/</a>&lt;wbr&gt;mailman/<wbr>listinfo/buildroot&lt;/a&gt;&lt;br&gt;<br>
&gt; &lt;/font&gt;&lt;/span&gt;&lt;/blockquote&gt;&lt;/<wbr>div&gt;&lt;br&gt;&lt;/div&gt;<br>
</div></div></blockquote></div><br></div>
