From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 29 Oct 2019 09:59:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/gst1-validate: allow to use
 host-python3 and target python3
In-Reply-To: <43afbd16-d440-0552-0148-288cbb75ffb5@railnova.eu>
References: <20191028111556.245007-1-titouan.christophe@railnova.eu>
 <79878267-e1f5-e992-985b-46d50c18e687@mind.be>
 <43afbd16-d440-0552-0148-288cbb75ffb5@railnova.eu>
Message-ID: <fd10d8ac-c0fa-b0bf-048f-d7f3e1c3c9a5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/10/2019 00:19, Titouan Christophe wrote:
> Good evening Arnout,
> 
> 
> On 10/28/19 11:35 PM, Arnout Vandecappelle wrote:
>>
>>
>> On 28/10/2019 12:15, Titouan Christophe wrote:
>>> +++ b/package/gstreamer1/gst1-validate/Config.in
>>> @@ -1,9 +1,10 @@
>>> ? config BR2_PACKAGE_GST1_VALIDATE
>>> ????? bool "gst1-validate"
>>> -??? depends on BR2_PACKAGE_PYTHON
>>> +??? depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
>>
>> ? Not directly related to this patch, but it would be better to use a select
>> instead of a depends here. 'depends' is for packages that are really
>> Python-related. 'select' is for when it's a package that just happens to be
>> implemented in python, like e.g. dstat. The boundary is sometimes a bit thin,
>> but I think in this case it's clearly the latter. But anyway, that's a separate
>> patch.
> 
> Ok
> 
>>
>>> ????? select BR2_PACKAGE_GST1_PLUGINS_BASE
>>> ????? select BR2_PACKAGE_JSON_GLIB
>>> -??? select BR2_PACKAGE_PYTHON_PYEXPAT
>>> +??? select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON
>>> +??? select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3
>>
>> ? There is no python3-pyexpat package. Target packages will automatically use the
>> python3 version if python3 is selected for the target. It is only when a
>> python3-only host package depends on some module that we need those python3-foo
>> packages.
> 
> Then, there is something I probably do not understand well:
> 
> $ git grep BR2_PACKAGE_PYTHON3_PYEXPAT | wc -l
> 20

 That is my stupidity. I didn't find a python3-pyexpat package. But that's
because it's not a separate package, but rather a suboption of python/python3.

 So your patch was perfectly fine.

>>> ????? # cairo is autodetected but needs PNG support
>>> ????? select BR2_PACKAGE_CAIRO_PNG if BR2_PACKAGE_CAIRO
>>> ????? help
>>> @@ -15,3 +16,4 @@ config BR2_PACKAGE_GST1_VALIDATE
>>> ? ? comment "gst1-validate depends on python"
>>> ????? depends on !BR2_PACKAGE_PYTHON
>>> +??? depends on !BR2_PACKAGE_PYTHON3
>>
>> ? Although correct, we typically write this as
>>
>> ????depends on !(BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3)
> 
> I already submitted some accepted patche(s?) that had the 2 "depends on" form,
> for instance supervisor. Is there a style guide somewhere I could follow ?
> 
> (IMHO, the 2 lines form is prettier and easier to understand for humans and
> diffs, but this is definitely a matter of taste </my2cents>)

 In matters of taste we aim for consistency. But that makes my proposal wrong as
well, because in two places we have:

	depends on !BR2_PACKAGE_PYTHON && !BR2_PACKAGE_PYTHON3

(which IMO is the worst option: it's less readable than the two lines that you
have, and it's not an exact negation of the dependency line in the package itself.)


 Since your patch was perfectly OK, I've now applied to master, thanks.

 Regards,
 Arnout
