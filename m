From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 17 Mar 2017 16:50:06 +0100
Subject: [Buildroot] [RFC PATCH 5/9] support/scripts: add
 create-relocation-script for toolchain relocation
In-Reply-To: <dc66e761-80aa-22ff-0d22-4ace059f82fe@grandegger.com>
References: <1488550733-3956-1-git-send-email-wg@grandegger.com>
 <1488550733-3956-6-git-send-email-wg@grandegger.com>
 <d7bcc124-0706-8cdf-2398-2a1d3fa4b3a4@mind.be>
 <dc66e761-80aa-22ff-0d22-4ace059f82fe@grandegger.com>
Message-ID: <b16c19af-1fb5-702f-01f8-ca9eb6ff13fb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-03-17 08:10, Wolfgang Grandegger wrote:
> Am 16.03.2017 um 18:51 schrieb Arnout Vandecappelle:
>> On 03-03-17 15:18, Wolfgang Grandegger wrote:
[snip]
>>> +# The toolchain is in buildroot's "host/usr"
>>> +TOOLCHAINDIR="$1/usr"
>>> +# We create the script in the top directory of the toolchain
>>> +SCRIPTFILE="${TOOLCHAINDIR}/relocate-toolchain.sh"
>>
>>  I think installing the script in host/usr/bin would be more appropriate.
> 
> I thought it's more visible/present in the root directory.

 Well, the root directory would be host, not host/usr, right?

>>> +# File holding the location of the buildroot toolchain
>>> +LOCATIONFILE="share/buildroot/toolchain-location"
>>> +
>>> +echo "Creating ${SCRIPTFILE} for toolchain relocation ..."
>>> +
>>> +cat << EOF > "${SCRIPTFILE}"
>>
>>  Instead of using cat to instantiate the template, it's easier to understand
>> what happens by creating a template file
>> (support/misc/relocate-toolchain.sh.in) and using sed to instantiate the
>> variables that need to be instantiated. Such a sed command can typically be
>> called directly from Makefile, without helper script.
> 
> I just see that you are looking to v1 of my RFC patch series. I have sent v2
> yesterday.

 Yes, I wrote this mail while offline and didn't see your new series until later.


> In v2 I use the name "SDK" instead of "toolchain".
> IIUC, the SDK is under "HOST_DIR" and the toolchain under "HOST_DIR/usr". And we
> want to relocate the SDK, right?

 There is no clear distinction between SDK or toolchain - SDK is a little bit
more, it can contain other host tools e.g. genimage. The usr part is just
historical accident that we are going to remove (when someone (i.e. me :-)
finally finds the time to do it).

 Anyway, for this series SDK is indeed a better term than toolchain.

>>  However, as far as I can see, the only thing that is instantiated in this
>> script is LOCATIONFILE. But that variable is actually constant, so it could be
>> coded directly in the script. So why not just $(INSTALL) the script itself, like
>> is done for e.g. support/misc/target-dir-warning.txt ?
> 
> Will adapt that solution. I was just not sure about the locations.
> 
[snip]
>>> +# Finally, we update the location file itself
>>> +sed -i s,"\${OLDPATH}",\${NEWPATH},g ./${LOCATIONFILE}
>>
>>  Why do this separately? It works within the loop above as well, doesn't it?
> 
> If the script is interrupted with ^C, you can through away the tree. If I update
> the location file at the end, just re-running the script will work.

 That's a very good reason. Add a comment above it to explain.

> 
>>> +
>>> +# Check if the path substitution did work properly
>>> +if [ "\${NEWPATH}" != "\$(cat ./${LOCATIONFILE})" ]; then
>>> +    echo "Something went wrong with substituting the path!"
>>> +    echo "Please choose another location for your toolchain!"
>>> +fi
>>
>>  Is there any reason why this error handling is needed? The only thing I can
>> imagine is concurrently running two instances of the script, but otherwise I see
>> no way that the sed could fail...
> 
> If the path /a/b/c/a/b/c is copied to /a/b/c, relocation (substitution) will not
> be correct. Maybe too much paranoia.

 No, a very good point actually! Maybe then a better approach is to first
generate the new location file (in a temporary new file), check that it looks
OK, and don't continue if it is not OK.

 Do add a comment to to explain the risk. You found this one instance where it
goes wrong, but there may be others as well.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
