From: Florent VIARD (Mojix) <florent.viard@mojix.com>
Date: Sun, 17 Nov 2019 19:15:43 +0100
Subject: [Buildroot] [PATCH 1/1] core: load a global.mk file if it
 exists to override global vars
In-Reply-To: <b1825789-a7c2-234d-5da6-41ddc34806ae@mind.be>
References: <06c9840e-2577-dc81-c0ab-f9301b5bcce7@mojix.com>
 <b1825789-a7c2-234d-5da6-41ddc34806ae@mind.be>
Message-ID: <2ff1fd16-a312-ecd3-de26-815d1c5c1038@mojix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Thank you for your message.

I didn't expect a change in the core to pass easily without a discussion :-)

Here are my replies to your comments:

>> Example:
>> -- global.mk --
>> BR2_EXTERNAL = ext-myproject
>  It would be more logical to use $(TOPDIR)/ext-myproject here.

True, but that was just for the example to be short and non confusing,
as anyway with or without $(TOPDIR) should be equivalent here.

>> It can also probably be used for BR2_VERSION customization or to add
>  Why would you want to customize BR2_VERSION?

As far as I know, there is no option for the user to define a custom
version,
and an os-release file with that info is always generated (hardcoded in
Makefile).
So, I guess, some users might be interested to tweak that for their
cases without hacking the Makefile.

>> global variables to be used in custom config files.
>  Both of those can be set in any of the external .mk files, or in local.mk.

In my case, I wanted this for the EXTERNAL case, but after a long time
thinking of alternative that would be specific to externals,
i came to the conclusion that it was nicer and cleaner to do something
generic like that.

(Ideas that I had were like, creating a new config file for external, or
moving the temporary .br2_external... files out of the "output" dir)

To be noted, external .mk files and local.mk are loaded later in the
process, and local.mk location can also be in an "out of tree" config
folder.

>> To give a little bit of context of the genesis of this change:
>> - I have a project using buildroot for a custom product.
>> - I have an "ext-myproject" folder at the root of TOPDIR that is an
>> external folder.
>> - All the configs, scripts or vendor specific packages are located
>> inside this external folder.
>>
>> Like that, the project is kind of "out-of-tree", with everything located
>> in a specific dir, and the buildroot original file/folders stay clean.
>> So, it is more easy to merge updated versions.
>  That's not how external was expected to be used. If you include your external
> inside the Buildroot tree, there's little point in making it external. You could
> just as well create a directory package/mojix and put your custom packages
> there, and configs/mojix_* and board/mojix for the rest.
>
>  And in this situation, you can in fact easily put the BR2_EXTERNAL =
> ext-myproject in the Buildroot Makefile in your repo. Merging that with an
> updated Buildroot is still going to be trivial.
>
>  The way an external is expected to be used is as follows:
>
> - buildroot as a subdirectory (probably submodule) of the external;
> - external includes a Makefile or other script to call into buildroot.
>
>  I'll append an example Makefile that I've used for some project. It would
> actually be nice to include something like that in Buildroot, and more
> importantly to add the above statements as proper documentation, but I've never
> gotten around to that...

I see that your are suggesting,? and it is not what I was thinking
external were designed for.

That being said, it is just my opinion, but I think that it is very nice
and convenient how I was using it.

In what you suggest, there are 2 things that I don't like very much:
1) Having to hack a core element of buildroot (Makefile) to hardcode
something.
I think that a lambda user would be scared and not do that,
and also, in 5 years, when someone else will take over my project,
he might have a hard time figuring it out that there is a hack in the
Makefile for the black magic to work.

2) Having my custom things spilled all other the place in configs,
package, board (or subfolder of it).
It has also to be taken into account that there might be other "things"
on the vendor folder side:
Assets, scripts, templates, ...
So, I like very much the concept of overlay, where you have the
buildroot itself that is kind of pristine,
and the vendor things that come cleanly with one or multiple nice
"external" overlays.

Sure, anyone can do higher level script or Makefile, but it is nice when
things kind of work directly out of the box.

>> As a side effect of this change, using this can help overcome a
>> regression in
>> buildroot that I have noticed:
>> External paths are supposed to be absolute or relative, but a change
>> pushed a few years ago, automatically change external relative path to
>> absolute before generating the temporary files.
>  Err, that sounds like the right thing to do, so what exactly is the regression?
> If there really is a regression, we'll want to fix it.

The documentation coming from the external feature original implementation:

https://buildroot.org/downloads/manual/manual.html#outside-br-custom

>> *Note.?*The path to a br2-external tree can be either absolute or
relative. If it is passed as a relative path, it is important to note
that it is interpreted relative to the main Buildroot source directory,
*not* to the Buildroot output directory.

The breaking change:

https://patchwork.ozlabs.org/patch/715359/

(That looks like to be a quick fix for an issue not looking at the root
cause itself)

Again, just my opinion, but the "absolute" path thing is quite bad.
Today, you can set the external as relative, not noticing that it will
be stored as absolute.
You did as said in the document, and so set the external once with a call to
BR2_EXTERNAL=ext-myproject make menuconfig

One day in the future, you move files, like "copying a project", and the
thing does not build anymore without apparent reason.

And even for the case that you described, with the external out of
TOPDIR, I think that in most cases it is probably cleaner to use a
relative reference like:

BR2_EXTERNAL=../../real-project-root
than
BR2_EXTERNAL=/home/marcel/tests/copy123/real-project-root


>  As noted, I've marked your patch as Rejected in patchwork. If others disagree
> with me, we can still go back to [1] and set it to New again.
>
:-)
>> Signed-off-by: Florent Viard <fviard@cxignited.com>

>>
>>  The e-mail address in your Signed-off-by should be the same as the author
>> address (i.e. the From of the mail).
>>
>>  This was line-wrapped. Did you use git send-email?
>>
Sorry, I usually don't contribute to plain text mailing-list based
project, too much a nightmare if you don't have all right conditions.
I sent it with thunderbird that I tried to configure correctly, but I
have the feeling that, on the way, there is the gmail server that mess
with my messages.


Florent




-- 


*
CONFIDENTIALITY NOTICE:*?This message and its contents are 
Confidential. If you received this message in error, do not use or rely 
upon it. Instead, please inform the sender and then delete it.

?

*AVISO 
DE CONFIDENCIALIDAD:?*Este mensaje y su contenido son de uso Confidencial.? 
Si usted ha recibido este mensaje por equivocaci?n no lo use ni conf?e en 
su contenido; asimismo, le pedimos notificar al remitente y borrar el 
mensaje.
